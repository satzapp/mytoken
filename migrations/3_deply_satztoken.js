const SatzToken = artifacts.require("../contracts/SatzToken");

module.exports = function (deployer) {
  deployer.deploy(SatzToken);
};