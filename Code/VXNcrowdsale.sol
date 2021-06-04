pragma solidity ^0.5.0;

import "./VXNtokenMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract VXNCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale {
    

    constructor(
        uint rate, // rate in VXNbits
        address payable wallet, // sale beneficiary
        uint cap,
        uint openingTime,
        uint closingTime,
        VXNtoken token // the VXNToken itself that the VXNCoinSale will work with
    )
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(cap)
        TimedCrowdsale(openingTime, closingTime)
        public
    {
        // constructor can stay empty
    }
}

contract VXNTokenSaleDeployer {

    address public vxn_sale_address;
    address public token_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet, // this address will receive all Ether raised by the sale
        uint cap
    )
        public
    {
        // create the VXNToken and keep its address handy
        VXNtoken token = new VXNtoken(name, symbol, 1000, 0);
        token_address = address(token);

        // create the VXNCoinSale and tell it about the token
        VXNCoinSale vxn_sale = new VXNCoinSale(1, wallet, cap, now, now + 5 minutes, token);
        vxn_sale_address = address(vxn_sale);

        // make the VXNCoinSale contract a minter, then have the VXNCoinSaleDeployer renounce its minter role
        token.addMinter(vxn_sale_address);
        token.renounceMinter();
    }
}
