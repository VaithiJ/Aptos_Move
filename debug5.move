module MyAddr::New{
    use std::debug;

    struct NewStruct has drop{
        id:u64,
        age:u8,
        booltest:bool
    }


    struct GenericStruct<t1,t2> has drop{
        quality:t1,
        learning:t2
    }


    public fun genStruct<t1,t2>(quality:t1, learning:t2): GenericStruct<t1,t2>{
        return GenericStruct{quality, learning}
    }

    public fun testStruct(id:u64, age:u8, bt:bool): NewStruct{
        return NewStruct{id, age, booltest:bt}
    }



    public fun get_id(f: NewStruct):u64{
        return f.id
    }




    #[test(account=@0x1)]
    public entry fun script_fn(){
        let f = MyAddr::New::testStruct(12,3,true);
        let id = f.id;
        // let id = get_id(f);
        debug::print(&id)
    }


    #[test(account=@0x1)]
    public entry fun script_generic(){
        let f = MyAddr::New::genStruct(10,100);
        let quality = f.quality;
        debug::print(&quality)

    }
}