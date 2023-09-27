module MyAddr::signerex{
    use aptos_std::signer;
    use aptos_std::debug;

    #[test(sn = @0x1)]
    public entry fun mainsign(sn:signer){
        let addr=signer::address_of(&sn);
        debug::print<address>(&addr)
    }
}