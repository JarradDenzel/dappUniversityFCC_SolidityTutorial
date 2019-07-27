pragma solidity 0.5.1;

// on the topics of libraries and math :)
// we use libraries of math functions in solidity so issa match made in heaven
// its lit
 
// so why do we use libraries? cuz its fun.
// nah. DRY = Dont Repeat Yourself

// it is true, solidity is a contract-oriented language
// therefore contracts are the main way we organize code in solidity
// however we also use libraries to define functions, store variables etc.
// libraries belong in a smart contract because they dont have full functionality of such
// more specifically, math library add an element of "safety"

// to clean things up, import the library function from another file


library math {
    function divide(uint256 a, uint256 b) internal pure returns (uint256){
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
}

contract myContract {
    uint256 public value;
    function calculate(uint256 _value1, uint256 _value2) public {
        value = math.divide(_value1, _value2);
    }
}