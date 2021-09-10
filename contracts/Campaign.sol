// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract Compaign {
    struct Request {
      string description;
      uint value;
      address payable recipient;
      bool complete;
    }
    
    address public manager;
    uint public minimumContribution;
    address payable[] public approvers;
    Request[] public requests;
    
   modifier restricted() {
        require(manager == msg.sender);
        _;
   }    

   constructor(uint minimum) {
        manager = msg.sender;
        minimumContribution = minimum;
   }
   
   function contribute() public payable {
        require(msg.value >= minimumContribution);
        approvers.push(payable(msg.sender));
   }
   
   function createRequest() public restricted {
       
   }
   
   function finalizeRequest() public restricted {
       
   }
    
    
}
