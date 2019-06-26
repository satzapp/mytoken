pragma solidity >=0.4.21 <0.6.0;

import "./MyToken.sol";

contract MyTokenSale {
    address admin;
    MyToken public tokenContract;
    uint256 public tokenPrice;

    constructor(MyToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}