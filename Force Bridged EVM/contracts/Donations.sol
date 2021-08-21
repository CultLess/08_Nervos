pragma solidity >0.8.0;

contract Donations{
    address payable public owner;
    
    constructor() public payable{
        owner=payable(msg.sender);
    }
    
    function getBalance() view public returns(uint256){
        return address(this).balance;
    }
    
    function makeDonations(uint256 amount) payable public
    {
        require(msg.value==amount);
    }
    
    function withdrawBalance() public {
        require(msg.sender==owner);
        payable(msg.sender).transfer(address(this).balance);
    }
    
}