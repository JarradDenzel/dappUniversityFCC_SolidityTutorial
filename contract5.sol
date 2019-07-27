pragma solidity 0.5.1;


// this contract implements inheritance...
// a parent-child relationship between smart contracts
// we want to create a token that inherits properties from ERC20Token

// so the ERC20Token is the parent contract

//...super.mint preserves the mint funtion of the ERC20Token parent contract
// so all in all, myToken adds functionality to the parent contract ERC20Token



contract ERC20Token{
    string public name;
    mapping(address => uint256) public balances;
    
    constructor(string memory _name) public{
        name = _name;
    }
    
    function mint() public {
        balances[tx.origin] ++;
    }
    
}

contract myToken is ERC20Token {
    string public symbol;    
    address[] public owners;
    uint256 ownerCount;
    
    constructor(
        string memory _name,
        string memory _symbol
        ) 
        ERC20Token(_name) 
        public {
        symbol = _symbol;
    }
    
    function mint() public{
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);       
    }

}