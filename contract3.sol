pragma solidity ^0.5.1;

// Simple example of what happens in an ICO...just for teaching the fundamentals
// The function buyToken simulates an ICO, but this is a VERY watered down version


// buy a Token

// A Buyer who wants the token, calls function buyToken of the target Token Contract
// Afterwards they'll send ether to the target Token Contract's wallet 
// The Token Contract will issue the Buyer a token to complete the transation

// First things first, create a way to track the tokens...
// Mapping method can be used to track a person's balance
// Mapping creates an associative array that uses key value pairs store data
// the mapping,called balances, sends one token for the sake of simplicity 

// So after we establish the tokenContract's "send the buyer one token" mechanism, balance,
// we establish a tokenContract wallet that receieves the ether sent by the buyer
// Declare a state variable of type address named wallet
// wallet.transfer in the buyToken fuction, transfers the funds sent to the function buy the buyer
// ... ... to the tokenContract's wallet.
// msg.value tells wallet.transfer how much ether the buyer sent to the tokenContract's buyToken f(x)
// To transfer the funds indicated my msg.value to the wallet, we need to set a constructor 
// In order for the buyToken f(x) to accept ether, add another modifier: payable
// Whenever you're declaring an address that can accept ether in a smart contract, explicitness...


// A fallback function = default f(x) that wraps up the buyToken f(x) 
// The purpose of a fallback f(x) is to make it easy to use a smart contract
// eg. during an ICO, when they say send ether to a certain contract's address
// ... ... the contract will buy the tokens on behalf of the sender
// The fallback function uses the modifier, external, 
// ... ... so the contract can be called outside the contract

// events are a way for external consumers to listen for actions of a smart contract
// external consumers do so via subscribing to the events of a smart contract
// To work with events so you can listen in on things that happen on a contract,
// you must declare an event, or what you want to listen to explicitly
// Events are triggered inside the target function of the contract
// Events can be filtered by adding the modifier indexed, 
// ... ... so you can subscribe based on a specific address




contract myContract{
    mapping(address => uint256) public balances;
    address payable wallet;
    
    event Purchase(
        address indexed _buyer,
        uint _amount
    );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function() external payable{
        buyToken();
    }
    
    function buyToken() public payable {
        
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
        
    }
}