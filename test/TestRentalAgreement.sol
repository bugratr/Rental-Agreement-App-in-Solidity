// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RentalAgreement.sol";

contract TestRentalAgreement {

    RentalAgreement rentalAgreement = RentalAgreement(DeployedAddresses.RentalAgreement());

    // Test the createAgreement() function
    function testUserCanCreateAgreement() public {
        uint expectedAgreementId = 0;
        uint returnedId = rentalAgreement.createAgreement(1 ether, 2 ether, 12, "123 Main St, Apt 4B");

        Assert.equal(returnedId, expectedAgreementId, "Creation of the first agreement should have an ID of 0.");
    }

    // Test retrieval of an agreement's landlord address
    function testGetLandlordAddressByAgreementId() public {
        address expectedLandlord = address(this);  // The test contract's address, since it's the one creating the agreement in the test

        address landlord = rentalAgreement.getLandlord(0);

        Assert.equal(landlord, expectedLandlord, "Landlord of the agreement ID 0 should be this contract.");
    }

    // Additional tests can be written for signing, terminating the agreement, etc.

}
