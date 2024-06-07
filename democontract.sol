
pragma solidity ^0.8.0;
contract mintYourCoins{
    address public minter;
    mapping (address => uint ) public  balance;
    event send(address from ,address to, uint amount);

    constructor()  {
        // this will ensure  only creator can mint new coins
        minter = msg.sender;
    }

    function mint(address receiver , uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balance[receiver]+= amount;
    }

    function sent(address receiver, uint amount) public {
        require(amount <= balance[msg.sender] , "Insufficient balance");
        balance[receiver] +=amount;
        emit send(msg.sender,receiver,amount);
    }

    function balances(address _account) external view returns (uint){
        return balance[_account];
    }

}