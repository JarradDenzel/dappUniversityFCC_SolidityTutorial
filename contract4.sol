pragma solidity 0.5.1;

// this is an example of one contract communicating to another
// because both contracts are in the same file, the "know" each other
// the objective is for the bottom contract to tell the ERC20Token contract
// that the bottom contract wants to mint tokens in the ERC20Token contract


// In order to do that, we need to know the address of both contracts
// the addresses are used as references 

// First, get the address of the ERC20Token contract
// Then, instantiate the bottom contract
// Last, call the mint function of the ERC20Token contract from the bottom one

//***pre-pend local variables with an underscore like the ERC20Token line in buyToken

// Since there are two contracts in this file, it must be deployed in two steps

//***gotcha = >>> msg.sender is address of myContract, 
//... ... NOT who sent the msg via myContract...so use  tx.origin
// tx.origin indicates the account holder who initiated the txn



contract ERC20Token{
    string public none;
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
    }
    
}

contract myContract{
    mapping(address => uint256) public balances;
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    function() external payable{
        buyToken();
    }
    
    function buyToken() public payable {
        ERC20Token(address(token)).mint(); 
        wallet.transfer(msg.value);
    }
}