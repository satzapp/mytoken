const MyToken = artifacts.require("../contracts/MyToken");

module.exports = function(deployer) {
  deployer.deploy(MyToken);
};
