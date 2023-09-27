module MyAddr::Ownership{
    use std::debug;


    public fun printex(a:u8):u8{
        a
    }



    #[test(account=@0x1)]
    public entry fun ownership(){
        let a:u8=22;
        let c:u8= printex(move a);
        // c=printex(a);
        debug::print<u8>(&c);
    }
}