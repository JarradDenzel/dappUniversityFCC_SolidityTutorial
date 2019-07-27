pragma solidity ^0.5.1;



contract myContract{
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    address owner;
    
    uint openingTime = 1564157600;
    
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }
    
    constructor() public{
        owner == msg.sender;
    }
    
    struct Person{
        uint id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(
        string memory _firstName, 
        string memory _lastName
    ) 
        public 
        onlyWhileOpen
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
          peopleCount +=1;
    }
    
    
}