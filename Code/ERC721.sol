pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";
import "./VXNtokenMintable.sol";

contract ArtRegistry is ERC721Full {
    
    VXNtoken public VXN_token;

    constructor() ERC721Full("NFT1", "NFT") public { }

    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    address payable vxn_lair_foundation = address(0x91cddaf29fd1de541D28af445e16a5a34084BEDC);
    address payable vxn = address(0xdf7253f7595E9e096DD1A6DB67fdD80Bc38Bff72);
    
    struct Artwork {
        string name;
        string artist;
        string signature;
        uint appraisal_value;
    }

    mapping(uint => Artwork) public art_collection;

    event Appraisal(uint token_id, uint appraisal_value, string report_uri);

    function registerArtwork(address owner, string memory name, string memory artist, uint initial_value, string memory token_uri, string memory signature) public returns(uint) {
        token_ids.increment();
        uint token_id = token_ids.current();

        _mint(owner, token_id);
        _setTokenURI(token_id, token_uri);

        art_collection[token_id] = Artwork(name, artist, signature, initial_value);
        
        vxn.transfer(initial_value * 4 / 100);
        vxn_lair_foundation.transfer(initial_value / 100);
        
        uint amount = initial_value * 10;
        
        VXN_token.transferFrom(msg.sender,address(this), amount);
        msg.sender.transfer(amount);
        
        return token_id;
    }

    function newAppraisal(uint token_id, uint new_value, string memory report_uri) public returns(uint) {
        art_collection[token_id].appraisal_value = new_value;

        emit Appraisal(token_id, new_value, report_uri);

        return art_collection[token_id].appraisal_value;
    }
      function sale(address from, address to, uint256 token_id) public {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), token_id), "ERC721: transfer caller is not owner nor approved");
        uint amount = art_collection[token_id].appraisal_value / 25;
        address payable one = address(0xdf7253f7595E9e096DD1A6DB67fdD80Bc38Bff72);
        one.transfer(amount);  
        
        transferFrom(to,from, amount);
        transferFrom(from, to, token_id);
    }  
    
    function () external payable {
    }
}
