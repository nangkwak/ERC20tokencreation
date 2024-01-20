// contract DiamondHandnpx s.sol
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// code created to create and deploy code for airdrops to various testnets and mainnets
// Created by Contractman for his subscribers

contract DiamondHands is ERC20Capped {
    address payable public owner;
    constructor(uint256 cap) ERC20("DiamondHands","DIAMOND") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mintnew(owner,cap * (10 ** decimals()));
    }

    function _mintnew(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(address(0), address(account), value);
    }



    function _update(address from, address to, uint256 value) internal virtual override(ERC20Capped) {
            super._update(from, to, value);

            if (from == address(0)) {
                uint256 maxSupply = cap();
                uint256 supply = totalSupply();
                if (supply > maxSupply) {
                    revert ERC20ExceededCap(supply, maxSupply);
                }
            }
        }


}