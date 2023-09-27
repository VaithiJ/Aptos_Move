module MyAddr::some{

    use aptos_std::debug;


    public fun main(a:u8, b:u8):u8{
        (a+b)
    }


    #[test(account=@0x1)]
    public entry fun do(){
        let c:u8=main(3,3);
        debug::print<u8>(&c)
    }
}











