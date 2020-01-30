pragma solidity ^0.5.16;
import "./AddressManager.sol";
import "./Consumer.sol";
import "./Producer.sol";
import "./Retailer.sol";

contract Collection Centre{
	mapping(uint => CollectionCentreDetails) CollectionCentres;
    uint public CollectionCentreCount;
    address public producerContractAddress;
    address owner;
    Producer producerInstance;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor(address _addressManager) public{
        owner = msg.sender;
        am = AddressManager(address(_addressManager));
    }

    struct CollectionCentreDetails{
        uint _id;
        string _name;
    }

    function addCollectionCentre(string memory _name) public{
        CollectionCentreCount++;
        CollectionCentres[CollectionCentreCount] = CollectionCentreDetails(CollectionCentreCount, _name);
    }

    function getProducerAddress() public onlyOwner{
        producerContractAddress = am.getAddress("Producer");
        producerInstance = Producer(address(producerContractAddress));
    }
}