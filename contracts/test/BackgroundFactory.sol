// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AutomationCompatibleInterface.sol";

/**@title A Random BackgroundFactory
 * @author The Dude & Captain.fresh
 * @notice This contract is for creating a random decentralized s
 * @dev This implements Chainlink VRF v2 and Chainlink Keepers
 */

contract BackgroundFactory {
    /* Types */
    struct Background {
        string name;
        uint dna;
    }
    Background[] public backgrounds;
    /* State variable */
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    /* Events */
    event NewBackground(uint backgroundId, string name, uint dna);

    /* functions */

    // private function to create our background and emits an event
    function _createBackground(string memory _name, uint _dna) private {
        backgrounds.push(Background(_name, _dna));
        uint id = backgrounds.length - 1;
        emit NewBackground(id, _name, _dna);
    }

    /**
     * @dev This is the function that the Chainlink keeper nodes call
     * they look for the `upkeepNeeded` to return true.
     * The following should be true in order to return true:
     * 1. Our time interval should have passed
     * 2. The lotteru shoud have at least 1 player, and have some ETH
     * 3. Our subscription is funded with LINK
     * 4. The lottery should be in an "open" state.
     */
    function pickRandomBackground() external {
        // request the random number
        //Once we get it, do smth with it
        // 2 transaction process
    }
}
