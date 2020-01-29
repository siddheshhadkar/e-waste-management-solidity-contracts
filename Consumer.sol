pragma solidity ^0.6.0;

contract Consumer{

    uint public consumerCount;
    mapping(uint => Consumer) consumers;
    address public addressRT;
    address owner;
    AddressManager am;
    Producer prInstance;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor(address _parentAddress) public{
        owner = msg.sender;
        am = AddressManager(address(_parentAddress));
    }

    struct Consumer{
        uint _id;
        string _name;
    }

    function addConsumer(string _name) public{
        consumerCount++;
        consumers[consumerCount] = Consumer(consumerCount, _name);
    }

    function getRTAddress() public onlyOwner{
        addressRT = am.getAddress("RT");
        prInstance(address(addressRT));
    }

    function sellWaste() public{

    }

    function receivePayment() public payable{

    }
}
