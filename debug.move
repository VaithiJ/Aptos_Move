module MyAddr::Owner{
    use aptos_std::debug;
    use std::signer;


    #[test(account=@0x1)]
    public entry fun debugex(account : signer){
        let a:u8=10;
        let addr = signer::address_of(&account);
        debug::print<address>(&addr);
        debug::print<u8>(&a);
    }
}