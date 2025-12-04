# MyToken (MTK)

## Overview
MyToken is a simple ERC-20 compatible token built on Ethereum for learning and experimentation purposes. This project demonstrates the fundamentals of smart contracts, token economics, and the ERC-20 token standard.  

---

## Token Details
- **Name**: MyToken  
- **Symbol**: MTK  
- **Decimals**: 18  
- **Total Supply**: 1,000,000 MTK  

---

## Features
- ✅ Standard ERC-20 implementation  
- ✅ Transfer tokens between addresses (`transfer`)  
- ✅ Approve spending for others (`approve`)  
- ✅ Delegate token transfers via `transferFrom`  
- ✅ Track balances (`balanceOf`)  
- ✅ Check allowances (`allowance`)  
- ✅ Emits `Transfer` and `Approval` events for transparency  
- ✅ Input validation (zero address, insufficient balance, insufficient allowance)  

---

## ERC-20 Overview
ERC-20 is a standard for fungible tokens on the Ethereum blockchain. It defines a common set of functions and events so tokens are compatible with wallets, exchanges, and other smart contracts.  

**Key points:**  
- Tokens follow a standard interface (`transfer`, `approve`, `transferFrom`, `balanceOf`, `allowance`)  
- Decimals (usually 18) allow fractional token amounts  
- `transfer` moves tokens from the caller's balance  
- `transferFrom` allows an approved spender to move tokens on behalf of the owner  

---

## Deployment Instructions
1. Open [RemixIDE](https://remix.ethereum.org/)  
2. Create a new file `MyToken.sol` in the `contracts/` folder  
3. Paste the Solidity source code of your ERC-20 token  
4. Select Solidity compiler version 0.8.x or higher  
5. Compile the contract (ensure no errors or warnings)  
6. Deploy the contract using **JavaScript VM**  
7. Enter your initial total supply (e.g., `1000000000000000000000000` for 1,000,000 tokens with 18 decimals)  
8. After deployment, your token will be fully functional  

---

## Usage Examples

### Check Balance
```solidity
balanceOf(address account) → returns uint256
