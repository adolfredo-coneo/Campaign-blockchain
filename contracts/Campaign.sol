// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

/**
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract Compaign {
    struct Request {
        string description;
        uint256 value;
        address payable recipient;
        bool complete;
    }

    address public manager;
    uint256 public minimumContribution;
    address payable[] public approvers;
    Request[] public requests;

    modifier restricted() {
        require(manager == msg.sender);
        _;
    }

    constructor(uint256 minimum) {
        manager = msg.sender;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value >= minimumContribution);
        approvers.push(payable(msg.sender));
    }

    function createRequest(
        string memory description,
        uint256 value,
        address payable recipient
    ) public restricted {
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false
        });

        requests.push(newRequest);
    }

    function approveRequest() public {}

    function finalizeRequest() public restricted {}
}
