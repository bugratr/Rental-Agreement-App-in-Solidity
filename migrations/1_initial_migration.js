const RentalAgreement = artifacts.require("RentalAgreement");
const DisputeResolution = artifacts.require("DisputeResolution");

module.exports = function(deployer) {
    deployer.deploy(RentalAgreement)
        .then(() => {
            return deployer.deploy(DisputeResolution, RentalAgreement.address);
        });
};
