// module MyAddr::game{

//     use std::signer;
//     use std::debug;

//     const STAR_ALREADY_EXISTS:u64 = 100;
//     const STAR_NOT_EXISTS:u64 = 101;


//     struct GameStar has drop,key{
//         name : vector<u8>,
//         country : vector<u8>,
//         position: u8,
//         value : u64,
//     }

//     public fun newStar(name: vector<u8>, country: vector<u8>, position:u8):GameStar{
//         return GameStar{name, country, position, value:0}
//     }


    // public fun mint(to: &signer, star: GameStar){
    //     let addr = signer::address_of(to);
    //     assert!(!exists<GameStar>(addr), STAR_ALREADY_EXISTS);
    //     move_to<GameStar>(to,star);
    // }


    // public fun get(owner : address):(vector<u8>, u64) acquires GameStar{
    //     let star = borrow_global<GameStar>(owner);
    //     (star.name, star.value)
    // }


//     public fun setPrice(owner : address, price : u64) acquires GameStar{
//         assert!(exists<GameStar>(owner),STAR_NOT_EXISTS);
//         let star = borrow_global_mut<GameStar>(owner);
//         star.value=price;
//     }


//     public fun transfer(owner: &signer, to: &signer) acquires GameStar{
//         let addrto = signer::address_of(to);
//         assert!(!exists<GameStar>(addrto), STAR_NOT_EXISTS);
//         let addowner = signer::address_of(owner);
//         assert!(!exists<GameStar>(addowner), STAR_ALREADY_EXISTS);
//         let star = move_from<GameStar>(addrto);
//         star.value = star.value + 20;
//         move_to<GameStar>(to,star);
//     }


//     #[test(owner=@0x42, at=@0x42)]
//     public entry fun script_game(owner : signer) acquires GameStar{
//         let star = MyAddr::game::newStar(b"yt", b"india",4);
//         MyAddr::game::mint(&owner, star);
//         let addowner = signer::address_of(&owner);
//         let (name, val) = MyAddr::game::get(addowner);
//         debug::print(&name);
//         debug::print(&val);

//         MyAddr::game::setPrice(addowner,100);
//     }
// }




module MyAddr::game{

    use std::debug;
    use std::signer;


    const STAR_ALREADY_EXISTS:u64=100;
    const STAR_NOT_EXISTS:u64=101;


    struct GameStar has key,drop{
        name: vector<u8>,
        country: vector<u8>,
        position: u8,
        value : u64,
    }
    
//     public fun newStar(name: vector<u8>, country: vector<u8>, position:u8):GameStar{
//         return GameStar{name, country, position, value:0}
//     }

    public fun newStar(name:vector<u8>, country:vector<u8>, position:u8):GameStar{
        return GameStar{name, country, position, value:0}
    }
       // public fun mint(to: &signer, star: GameStar){
    //     let addr = signer::address_of(to);
    //     assert!(!exists<GameStar>(addr), STAR_ALREADY_EXISTS);
    //     move_to<GameStar>(to,star);
    // }

    public fun mint(to : &signer, star: GameStar){
        let addr = signer::address_of(to);
        assert!(!exists<GameStar>(addr), STAR_ALREADY_EXISTS);
        move_to<GameStar>(to,star);
    }

       // public fun get(owner : address):(vector<u8>, u64) acquires GameStar{
    //     let star = borrow_global<GameStar>(owner);
    //     (star.name, star.value)
    // }


//     public fun setPrice(owner : address, price : u64) acquires GameStar{
//         assert!(exists<GameStar>(owner),STAR_NOT_EXISTS);
//         let star = borrow_global_mut<GameStar>(owner);
//         star.value=price;
//     }

        public fun get(owner: address):(vector<u8>, u64) acquires GameStar{
            let star = borrow_global<GameStar>(owner);
            (star.name, star.value)
        }

        public fun setPrice(owner:address, price:u64) acquires GameStar{
            assert!(exists<GameStar>(owner), STAR_NOT_EXISTS);
            let star = borrow_global_mut<GameStar>(owner);
            star.value=price;
        }

        //     public fun transfer(owner: &signer, to: &signer) acquires GameStar{
//         let addrto = signer::address_of(to);
//         assert!(!exists<GameStar>(addrto), STAR_NOT_EXISTS);
//         let addowner = signer::address_of(owner);
//         assert!(!exists<GameStar>(addowner), STAR_ALREADY_EXISTS);
//         let star = move_from<GameStar>(addrto);
//         star.value = star.value + 20;
//         move_to<GameStar>(to,star);
//     }
         public fun transfer(to : &signer, owner: &signer) acquires GameStar{
            let addrOwner = signer::address_of(owner);
            assert!(exists<GameStar>(addrOwner), STAR_NOT_EXISTS);
            let addrTo = signer::address_of(to);
            assert!(!exists<GameStar>(addrTo), STAR_ALREADY_EXISTS);
            let star = move_from<GameStar>(addrOwner);
            star.value = star.value + 20;
            move_to<GameStar>(to, star);

         }

//     #[test(owner=@0x42, at=@0x42)]
//     public entry fun script_game(owner : signer) acquires GameStar{
//         let star = MyAddr::game::newStar(b"yt", b"india",4);
//         MyAddr::game::mint(&owner, star);
//         let addowner = signer::address_of(&owner);
//         let (name, val) = MyAddr::game::get(addowner);
//         debug::print(&name);
//         debug::print(&val);

//         MyAddr::game::setPrice(addowner,100);
//     }

       #[test(owner=@0x42, at=@0x43)]
       public entry fun script_game(owner: signer) acquires GameStar{
            let star = MyAddr::game::newStar(b"yt" , b"india",4);
            MyAddr::game::mint(&owner, star);
            let addrOwner = signer::address_of(&owner);
                        MyAddr::game::setPrice(addrOwner,100);

            let (name, val) = MyAddr::game::get(addrOwner);
            debug::print(&name);
            debug::print(&val);
       } 
}