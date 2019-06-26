const MyToken = artifacts.require("../contracts/MyToken");
const MyTokenSale = artifacts.require("../contracts/MyTokenSale");

module.exports = function (deployer) {
  deployer.deploy(MyToken, 1000000).then(function () {
    var tokenPrice = 1000000000000000;
    return deployer.deploy(MyTokenSale, MyToken.address, tokenPrice);
  });
};