// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC721Base.sol";
import "@thirdweb-dev/contracts/extension/PermissionsEnumerable.sol";

contract Contract is ERC721Base, PermissionsEnumerable {

    mapping(uint => string) public nfts;
    bytes32 public constant IDENTITY_ROLE = keccak256("IDENTITY_ROLE");

    function setNickname(uint _tokenId, string calldata _identity) public onlyRole(IDENTITY_ROLE) {
        nfts[_tokenId] = _identity;
    }

    constructor(
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps
    )
        ERC721Base(
            _name,
            _symbol,
            _royaltyRecipient,
            _royaltyBps
        )
    {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(IDENTITY_ROLE, msg.sender);
    }


}