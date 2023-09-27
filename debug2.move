module MyAddr::addition{
    use aptos_std::debug;

    public fun adding(a:u8, b:u8) : u8{
        a+b
    }

    #[test(account=@0x1)]
    public entry fun addex(){
        let c:u8= adding(1,1);
        debug::print<u8>(&c);
    }

}





