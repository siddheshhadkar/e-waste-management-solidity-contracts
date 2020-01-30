pragma solidity ^0.5.0;

import "./AddressManager.sol";
import "./Consumer.sol";
import "./CollectionCentre.sol";
import "./Retailer.sol";
 
contract Producer {

	mapping (uint => address) public soldHistory;
	mapping (uint => Product)public productStock;
	
	address owner;
	address producer;
	AddressManager am;
	uint productCount;
	uint balanceOfProducer;

	modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    modifier onlyProducer(){
        require(msg.sender == producer);
        _;
    }

    struct Product {
    	string name;
    	string type;
    }
    
	
	constructor(address memory _addressManager) public {
    	owner=msg.sender;
    	am=AddressManager(address(_addressManager));
	}

	function setProducerAddress (address memory _producer) public onlyOwner {
		producer=_producer;
	}
	

	function addProduct (string memory _name,string memory _type) public onlyProducer{
		productCount++;
		productStock[productCount]=Product(_name,_type);
	}
	
	function sellToRetailer (address _adressRetailer,uint _productId) public payable{
		uint amount=msg.value;
		balanceOfProducer+=amount;

		require (!soldHistory[_productId]);
		
		soldHistory[_productId]=_adressRetailer;
	}



	

}

  


