// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/contracts/libraries/BeaconChainProofsWrapper.sol";

contract DeployBeaconChainProofsWrapper is Script {
    function run() external {
        // Get deployer private key from environment
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        
        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);

        // Deploy BeaconChainProofsWrapper
        BeaconChainProofsWrapper wrapper = new BeaconChainProofsWrapper();
        
        // Stop broadcasting transactions
        vm.stopBroadcast();

        // Log the deployed address
        console.log("BeaconChainProofsWrapper deployed to:", address(wrapper));
    }
} 