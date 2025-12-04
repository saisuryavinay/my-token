// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title MyToken - Simple ERC-20 compatible token for learning
/// @notice This contract implements a basic ERC-20 token with fixed total supply
contract MyToken {
    // -----------------------------
    // Token metadata
    // -----------------------------

    // Name of the token (e.g., "MyToken")
    string public name = "MyToken";

    // Symbol of the token (e.g., "MTK")
    string public symbol = "MTK";

    // Number of decimal places (18 is standard for ERC-20)
    uint8 public decimals = 18;

    // Total supply of tokens in smallest units (including decimals)
    uint256 public totalSupply;

    // -----------------------------
    // Balances & allowances
    // -----------------------------

    // Mapping to track how many tokens each address owns
    mapping(address => uint256) public balanceOf;

    // Nested mapping to track allowances:
    // owner => (spender => amount allowed to spend)
    mapping(address => mapping(address => uint256)) public allowance;

    // -----------------------------
    // Events (required by ERC-20)
    // -----------------------------

    // Emitted when tokens are transferred between addresses
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Emitted when an address approves another to spend its tokens
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // -----------------------------
    // Constructor
    // -----------------------------

    /// @notice Constructor mints the initial total supply to the deployer
    /// @param _initialSupply Total supply in smallest units (e.g., 1,000,000 * 10^18)
    constructor(uint256 _initialSupply) {
        // Set total supply based on constructor parameter
        totalSupply = _initialSupply;

        // Assign all tokens to the address that deploys the contract
        balanceOf[msg.sender] = _initialSupply;

        // Emit Transfer event from the zero address to show minting
        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    // -----------------------------
    // Core ERC-20 functions
    // -----------------------------

    /// @notice Transfer tokens from the caller to another address
    /// @param _to Recipient address
    /// @param _value Amount of tokens to send
    /// @return success True if transfer succeeds
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Prevent sending to zero address (acts like burning unintentionally)
        require(_to != address(0), "Cannot transfer to zero address");

        // Check that the sender has enough tokens
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Subtract tokens from sender
        balanceOf[msg.sender] -= _value;

        // Add tokens to recipient
        balanceOf[_to] += _value;

        // Emit Transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /// @notice Approve another address to spend tokens on behalf of the caller
    /// @param _spender Address that is allowed to spend
    /// @param _value Amount of tokens they are allowed to spend
    /// @return success True if approval succeeds
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // Prevent approving the zero address
        require(_spender != address(0), "Cannot approve zero address");

        // Set the allowance for the spender
        allowance[msg.sender][_spender] = _value;

        // Emit Approval event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    /// @notice Transfer tokens from one address to another using an existing allowance
    /// @param _from Address to take tokens from
    /// @param _to Recipient address
    /// @param _value Amount of tokens to transfer
    /// @return success True if transfer succeeds
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Prevent sending to zero address
        require(_to != address(0), "Cannot transfer to zero address");

        // Check that the _from address has enough balance
        require(balanceOf[_from] >= _value, "Insufficient balance");

        // Check that msg.sender is allowed to spend at least _value tokens from _from
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Subtract tokens from _from
        balanceOf[_from] -= _value;

        // Add tokens to recipient
        balanceOf[_to] += _value;

        // Decrease the allowance
        allowance[_from][msg.sender] -= _value;

        // Emit Transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }

    // -----------------------------
    // Helper / convenience functions
    // -----------------------------

    /// @notice Get the total supply of tokens
    /// @return The total supply of tokens
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    /// @notice Get basic token metadata in one function call
    /// @return tokenName The name of the token
    /// @return tokenSymbol The symbol of the token
    /// @return tokenDecimals The number of decimals
    /// @return tokenTotalSupply The total token supply
    function getTokenInfo()
        public
        view
        returns (
            string memory tokenName,
            string memory tokenSymbol,
            uint8 tokenDecimals,
            uint256 tokenTotalSupply
        )
    {
        return (name, symbol, decimals, totalSupply);
    }
}