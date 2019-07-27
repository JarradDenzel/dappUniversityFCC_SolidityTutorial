pragma solidity ^0.5.1;

// simple enum contract 

contract myFirst{
    enum State { Waiting, Ready, Active }    
    State public state;
    
    constructor() public {
        state = State.Waiting;
    }
    
    function activate() public {
        state = State.Active;
    }
    
    function isActive() public view returns(bool){
        return state == State.Active;
    }
}