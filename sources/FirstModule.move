module 0xCAFE::BaseCoin{
    #[test_only]
    use std::signer;

    struct Coin has key{
        value:u64
    }

    /// Struct representing the balance of each address.
    struct Balance has key {
        coin: Coin // same Coin from Step 1
    }


    public fun mint(account:signer,value:u64){
        move_to(&account,Coin{value});
    }

    // Declare a unit test. It takes a signer called `account` with an
    // address value of `0xC0FFEE`.
    #[test(account = @0xC0FFEE)]
    fun test_mint_10(account: signer) acquires Coin {
        let addr = signer::address_of(&account);
        mint(account, 10);
        // Make sure there is a `Coin` resource under `addr` with a value of `10`.
        // We can access this resource and its value since we are in the
        // same module that defined the `Coin` resource.
        assert!(borrow_global<Coin>(addr).value == 10, 0);
    }

    /// Publish an empty balance resource under `account`'s address. This function must be called before
/// minting or transferring to the account.
public fun publish_balance(account: &signer) { ... }

/// Mint `amount` tokens to `mint_addr`. Mint must be approved by the module owner.
public fun mint(module_owner: &signer, mint_addr: address, amount: u64) acquires Balance { ... }

/// Returns the balance of `owner`.
public fun balance_of(owner: address): u64 acquires Balance { ... }

/// Transfers `amount` of tokens from `from` to `to`.
public fun transfer(from: &signer, to: address, amount: u64) acquires Balance { ... }
}