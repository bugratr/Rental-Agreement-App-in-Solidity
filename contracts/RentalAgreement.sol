// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RentalAgreement {

    // Enum to represent the state of a rental agreement
    enum AgreementState {
        Created,
        Signed,
        InEffect,
        Terminated
    }

    struct Agreement {
        address landlord;
        address tenant;
        uint256 monthlyRent; // In wei
        uint256 depositAmount; // In wei
        uint256 duration; // In months
        AgreementState state;
        string propertyDetails;
    }

    Agreement[] public agreements;

    // Events
    event AgreementCreated(uint256 agreementId, address landlord, string propertyDetails);
    event AgreementSigned(uint256 agreementId, address tenant);
    event AgreementTerminated(uint256 agreementId);

    function createAgreement(uint256 monthlyRent, uint256 depositAmount, uint256 duration, string memory propertyDetails) public returns (uint256) {
        Agreement memory newAgreement = Agreement({
            landlord: msg.sender,
            tenant: address(0),
            monthlyRent: monthlyRent,
            depositAmount: depositAmount,
            duration: duration,
            state: AgreementState.Created,
            propertyDetails: propertyDetails
        });

        agreements.push(newAgreement);
        uint256 agreementId = agreements.length - 1;
        emit AgreementCreated(agreementId, msg.sender, propertyDetails);

        return agreementId;
    }

    function signAgreement(uint256 agreementId) public {
        require(agreementId < agreements.length, "Invalid agreement ID");
        Agreement storage agreement = agreements[agreementId];

        require(agreement.state == AgreementState.Created, "Agreement not in creatable state");
        require(agreement.landlord != msg.sender, "Landlord cannot sign the agreement");

        agreement.tenant = msg.sender;
        agreement.state = AgreementState.Signed;

        emit AgreementSigned(agreementId, msg.sender);
    }

    function terminateAgreement(uint256 agreementId) public {
        require(agreementId < agreements.length, "Invalid agreement ID");
        Agreement storage agreement = agreements[agreementId];

        require(agreement.landlord == msg.sender || agreement.tenant == msg.sender, "Only involved parties can terminate the agreement");
        require(agreement.state == AgreementState.Signed || agreement.state == AgreementState.InEffect, "Agreement not in terminable state");

        agreement.state = AgreementState.Terminated;

        emit AgreementTerminated(agreementId);
    }

    // Additional functions can be added for handling rents, deposits, disputes, etc.

}
