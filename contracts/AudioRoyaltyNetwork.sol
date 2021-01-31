//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.0;

pragma experimental ABIEncoderV2;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract AudioRoyaltyNetwork is ERC721, AccessControl {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  struct AudioProject {
    uint256 id;
    string name;
    address creator;
    uint256 created_at;
    uint256[] parents;
    uint256 generation;
    string [] samples; // stores many AudioSample
    string picture;
    string blurb;
    bool looping;
  }

  struct AudioSample {
    uint256 id;
    string name;
    address creator;
    uint256 created_at;
    string source;
    string preview;
  }

  mapping(uint256 => AudioProject) private _token;

  constructor() public ERC721("AudioRoyaltyNetwork", "ARN") {
  }

  function registerProject(
    string calldata name,
    uint256[] calldata parents,
    string[] calldata samples,
    string calldata picture,
    string calldata blurb,
    bool looping
  ) 
    public
    returns (uint256)
  {
    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();
    _mint(msg.sender, newItemId);
    // _setTokenURI(newItemId, tokenURI);

    return newItemId;

  }

}
