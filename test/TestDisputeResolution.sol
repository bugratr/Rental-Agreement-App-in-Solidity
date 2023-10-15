// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RentalAgreement.sol";
import "../contracts/DisputeResolution.sol";

contract TestDisputeResolution {

    RentalAgreement rentalAgreement = RentalAgreement(DeployedAddresses.RentalAgreement());
    DisputeResolution disputeResolution = DisputeResolution(DeployedAddresses.DisputeResolution());

    // Test the raiseDispute() function
    function testUserCanRaiseDispute() public {
        uint expectedDisputeId = 0;
        
        // Create an agreement first
        uint agreementId = rentalAgreement.createAgreement(1 ether, 2 ether, 12, "456 Broadway, Apt 5C");

        uint returnedId = disputeResolution.raiseDispute(agreementId, "Broken amenities not fixed.");

        Assert.equal(returnedId, expectedDisputeId, "Raising the first dispute should have an ID of 0.");
    }

    // Test the resolveDispute() function
    function testDisputeCanBeResolved() public {
        uint disputeId = 0;
        string memory resolution = "Landlord has agreed to fix the amenities within a week.";

        disputeResolution.resolveDispute(disputeId, resolution);

        // For a more comprehensive test, you would ideally retrieve the dispute and ensure its state has changed to Resolved, and the resolution text matches.
        // However, for this example, we're keeping it simple.
    }

    // Additional tests can be written for other functionalities of the DisputeResolution contract.

}
