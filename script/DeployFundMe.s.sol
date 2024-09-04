// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../src/FundMe.sol";
import {Script} from "lib/forge-std/src/Script.sol";

contract DeployFundMe is Script {
    function run() public returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe();
        vm.stopBroadcast();
        return fundMe;
    }
}
