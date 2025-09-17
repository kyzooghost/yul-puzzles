// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {

    function main(address[] calldata recipients) external payable {
        assembly {
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length
            let amount := div(selfbalance(), recipients.length)
            for { let i := 0 } lt(i, recipients.length) { i := add(i, 1) } {
                let recipient_i := calldataload(add(recipients.offset, mul(i, 0x20)))
                let success := call(gas(), recipient_i, amount, 0, 0, 0, 0)
                if iszero(success) {
                    returndatacopy(0, 0, returndatasize())
                    revert(0, returndatasize())
                }
            }
        }
    }
}