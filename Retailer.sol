pragma solidity ^0.5.16;
import "./AddressManager.sol";
import "./Consumer.sol";
import "./Producer.sol";

contract Retailer{

    mapping(uint => RetailerDetails) retailers;
    uint public retailerCount;
    address public consumerContractAddress;
    address public producerContractAddress;
    address owner;
    AddressManager am;
    Consumer consumerInstance;
    Producer producerInstance;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor(address _addressManager) public{
        owner = msg.sender;
        am = AddressManager(address(_addressManager));
    }

    struct RetailerDetails{
        uint _id;
        string _name;
    }

    function addRetailer(string memory _name) public{
        retailerCount++;
        retailers[retailerCount] = RetailerDetails(retailerCount, _name);
    }

    function getConsumerAddress() public onlyOwner{
        consumerContractAddress = am.getAddress("Consumer");
        consumerInstance = Consumer(address(consumerContractAddress));
    }
    function getProducerAddress() public onlyOwner{
        producerContractAddress = am.getAddress("Producer");
        producerInstance = Producer(address(producerContractAddress));
    }

    function makeConsumerPayment() public payable{

    }

    function receiveProducerPayment() public payable{

    }

    function receiveConsumerItem() public{

    }

    function sellItemProducer() public{
        
    }
}