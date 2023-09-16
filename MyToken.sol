pragma solidity ^0.8.9;

// SPDX-License-Identifier: MIT

import "./ERC20.sol";
import "./Ownable.sol";
import "./IContract.sol";

contract MyToken is ERC20, Ownable {

    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }
    
    // function to allow admin to transfer *any* BEP20 tokens from this contract..
    function transferAnyERC20Tokens(address tokenAddress, address recipient, uint256 amount) public onlyOwner {
        require(amount > 0, "$EARN: amount must be greater than 0");
        require(recipient != address(0), "$EARN: recipient is the zero address");
        require(tokenAddress != address(this), "$EARN: Not possible to transfer $EARN");
        IContract(tokenAddress).transfer(recipient, amount);
    }
}
