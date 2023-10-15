// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RentalAgreement.sol";

contract DisputeResolution {

    // Enum to represent the state of a dispute
    enum DisputeState {
        Created,
        UnderReview,
        Resolved
    }

    struct Dispute {
        uint256 agreementId;
        address raisedBy;
        string description;
        DisputeState state;
        string resolution;
    }

    Dispute[] public disputes;
    RentalAgreement private rentalAgreementContract;

    // Events
    event DisputeRaised(uint256 disputeId, uint256 agreementId, address raisedBy);
    event DisputeResolved(uint256 disputeId, string resolution);

    constructor(address _rentalAgreementContractAddress) {
        rentalAgreementContract = RentalAgreement(_rentalAgreementContractAddress);
    }

    function raiseDispute(uint256 agreementId, string memory description) public returns (uint256) {
        // Ensuring that the one raising the dispute is part of the agreement
        (address landlord, address tenant,,,) = rentalAgreementContract.agreements(agreementId);
        require(msg.sender == landlord || msg.sender == tenant, "Not a party of the agreement");

        Dispute memory newDispute = Dispute({
            agreementId: agreementId,
            raisedBy: msg.sender,
            description: description,
            state: DisputeState.Created,
            resolution: ""
        });

        disputes.push(newDispute);
        uint256 disputeId = disputes.length - 1;
        emit DisputeRaised(disputeId, agreementId, msg.sender);

        return disputeId;
    }

    function resolveDispute(uint256 disputeId, string memory resolution) public {
        // For demonstration purposes, anyone can resolve a dispute. In a real-world scenario, this should be restricted to authorized arbiters or the involved parties.
        require(disputeId < disputes.length, "Invalid dispute ID");
        Dispute storage dispute = disputes[disputeId];

        require(dispute.state == DisputeState.Created, "Dispute not in resolvable state");

        dispute.state = DisputeState.Resolved;
        dispute.resolution = resolution;

        emit DisputeResolved(disputeId, resolution);
    }

    // Additional functions can be added to further manage and escalate disputes if necessary.

}
