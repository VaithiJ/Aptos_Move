module MyAddr::math{

    use aptos_std::debug;


    public fun max(a:u8, b:u8):u8{

        if(a>b)
            {a}
            else{b}
        
    }


    public fun whilen(n:u8):u8{
        let i:u8=1;
        let sum:u8=0;
        while(i<=n){
            sum = sum + i;
            i = i+1;
        };
        sum
    }


    public fun sub(a:u8, b:u8) :u8{
        (a-b)
    }


    public fun mul(a:u8, b:u8):u8{
        {a*b}
    }


    #[test(account=@0x1)]
    public entry fun math(){
        let c:u8=whilen(10);
        debug::print<u8>(&c)
    }


    #[test(account=@0x1)]
    public entry fun maxx(){
        let c:u8=max(2,4);
        debug::print<u8>(&c)
    }


    #[test(account=@0x1)]
    public entry fun mult(){
        let c:u8=mul(3,3);
        debug::print<u8>(&c)
    }
}