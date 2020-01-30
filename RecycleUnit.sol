pragma solidity ^0.5.16;
import "./AddressManager.sol";
import "./CollectionCentre.sol";

contract RecycleUnit{

    mapping(uint => RecycleUnitDetails) RecycleUnits;
    uint public RecycleUnitCount;
    address public CollectionCentreContractAddress;
    address owner;
    AddressManager am;
    CollectionCentre CollectionCentreInstance;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    constructor(address _addressManager) public{
        owner = msg.sender;
        am = AddressManager(address(_addressManager));
    }

    struct RecycleUnitDetails{
        uint _id;
        string _name;
    }

    function addRecycleUnit(string memory _name) public{
        RecycleUnitCount++;
        RecycleUnits[RecycleUnitCount] = RecycleUnitDetails(RecycleUnitCount, _name);
    }

    function getCollectionCentreAddress() public onlyOwner{
        CollectionCentreContractAddress = am.getAddress("CollectionCentre");
        CollectionCentreInstance = CollectionCentre(address(CollectionCentreContractAddress));
    }

    

    function receiveItemCollectionCentre() public{

    }
}
