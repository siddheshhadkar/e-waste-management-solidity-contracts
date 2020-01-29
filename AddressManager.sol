pragma solidity ^0.6.0;

contract AddressManager{

    address owner;
    mapping(string => address) public contractAddress;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor() public{
        owner = msg.sender;
    }

    function setAddress(string _contractName, address _contractAddress) public onlyOwner{
        contractAddress[_contractName] = _contractAddress;
    }

    function getAddress(string _contractName) view public returns(address) onlyOwner{
        return contractAddress[_contractName];
    }
}
