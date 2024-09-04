// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test, console} from "lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address testAddress = makeAddr("testAddress");

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testFundFailsWithoutEnoughEth() public {
        vm.expectRevert();
        fundMe.fund(){value: 0 ether};
    }

    function testFundUpdatesDataStructure() public {
        vm.prank(testAddress);
        vm.deal(testAddress, 3 ether);
        fundMe.fund{value: 1 ether}();
        assertEq(fundMe.getAddressToAmountFunded(testAddress), 1 ether);
    }
}
