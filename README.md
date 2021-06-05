# Project3-VIXEN
[![Solidity Forum](https://img.shields.io/badge/Solidity_Forum%20-discuss-brightgreen?style=plastic&logo=discourse)](https://forum.soliditylang.org/)
[![GitHub license](https://img.shields.io/github/license/smartcontractkit/chainlink?style=flat-square)](https://github.com/smartcontractkit/chainlink/blob/master/LICENSE)



## NFT VXN Objective

NFT VXN’s objective is to promote global female artistic empowerment and advancement through technology. It is an online gallery and sales platform for female artists and designers to sell their one of a kind art and design works, in digital or tangible form at either an auction or set price through NFTs.  Artist royalties, determined by the artist, will be embedded into the NFTs guaranteeing that the artist is rewarded for her work at every resale.  Every NFT purchase will be made in ether. NFT VXN will take a modest  4% purchase fee, 3% of which will go to cover the operations, and 1% will be converted into VXN native ERC-20 token, in order to help fund our VXN Lair Foundation. The purpose of the VXN Lair is to fund art-through-tech education, curatorial and residency programs, as well as grants and collaborations for female artists globally.  With both NFT VXN and NFT Lair we aim to help transform female artist lives by exposure to a new crypto-audience, increase their sales, and earn the deserved recognition across the digital media-scape.

## Crowdsale

One to two months prior to the official launch of NFTVXN.com we will hold our native (ERC-20) VXN crowdsale. Its objective is to help fund the software development, marketing and advertising budgets, and cover operating costs. The duration of the sale will be 4 weeks and initial offering is at 20 cents per VXN token. The payment will be accepted in the form of ether. The outcome of the crowd sale will be indicative of public interest in the NFT VXN project, and will allow us to adjust our business model accordingly.  

## NFT VXN FLOW

The flow of our NFT VXN is as follows- Artist sets up her Metamask Google Chrome extension wallet and purchases some ether to cover the gas fees. Then she connects her Metamask to NFT VXN, uploads the image, video file, or gif of artwork along with relevant information such as name, title, date, description and royalties etc. and chooses “create” option which initializes the wallet.  This process uploads the files and mints her NFT token. Afterwards she is asked to sign the sell order and once that’s done the NFT is minted.  She can then proceed to put it for sale by assigning her price and confirming its for sale status. 

To win a bid or purchase NFT from NFT VXN is a simple, straightforward process.  The buyer will also need to sign into his/her Metamask wallet and make sure there are sufficient funds to cover the transaction.  Once the artwork and buy option is chosen, he or she will be taken to the checkout, where upon a successful transaction, he or she will be a proud owner of his or her unique NFT, which serves as a certificate of authenticity, creating an undisputed ownership.  For the first few months our platform will offer a bonus of 500 VXN tokens each to both artist and buyer.

Smart contracts will insure the direct and correct distribution of the sale and bonus proceeds. The NFT token will be stored on the blockchain, and the smart contract will contain an url which will tell where the actual data is stored on a system like IPFS.  Blockchain uses InterPlanetary File System (IPFS) to confirm attribution of the artist who created the piece and ensure ownership. As opposed to a centrally located server, IPFS is built around a decentralized system of user-operators who hold a portion of the overall data. This creates a resilient system of file storage and sharing. 

The code VXNtokenMintable.sol:
```
pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

contract VXNtoken is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        string memory symbol,
        uint initial_supply, 
        uint total_supply
    )
        ERC20Detailed(name, symbol, 18)
        public
    {
        total_supply = initial_supply * 10 ** uint256(18);  // Update total supply with the decimal amount
        //balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        _mint(msg.sender, total_supply);
        // constructor can stay empty
    }
}

```



## Solidity
* Official Solidity docs: http://solidity.readthedocs.io/en/develop/index.html
* Solidity Features: https://github.com/ethereum/wiki/wiki/Solidity-Features
* About Solidity: https://en.wikipedia.org/wiki/Solidity
* EthDocs on Contracts: http://www.ethdocs.org/en/latest/contracts-and-transactions/contracts.html
* ConsenSys smart contracts best practices: https://github.com/ConsenSys/smart-contract-best-practices
* Solidity Examples: http://solidity.readthedocs.io/en/develop/solidity-by-example.html
* Solidity Tutorials: https://ethereumbuilders.gitbooks.io/guide/content/en/solidity_tutorials.html
* Advanced Solidity Tutorials by Monax.io: https://monax.io/docs/tutorials/solidity/solidity_1_the_five_types_model/
* OpenZeppelin Smart Contracts: https://github.com/OpenZeppelin/zeppelin-solidity
* https://github.com/axic/density
* http://solidity.readthedocs.io/en/develop/common-patterns.html


## Faucet
* http://faucet.ropsten.be:3001/





