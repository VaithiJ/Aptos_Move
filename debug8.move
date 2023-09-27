module MyAddr::Collnn{
    use std::debug;
    use std::signer;
    use std::vector;


    struct Item has store, drop{}


    struct Collection has store, key{
        items :vector<Item>
    }

public fun mainddd( account : &signer) {
    let current_account = signer::address_of(account);
    debug::print<address>(&current_account)
}
    public fun start_collection(account: &signer){
        move_to<Collection>(account, Collection{items :vector::empty<Item>()})
    }

    
    public fun exists_at(at: address):bool{
        exists<Collection>(at )
    }

    public fun add_item(account : &signer) acquires Collection{

        let addr = signer::address_of(account);
        let collection = borrow_global_mut<Collection>(addr);
        vector::push_back(&mut collection.items, Item{})

    }

    //   public fun remove_item(account : &signer) acquires Collection {

    //     let addr = signer::address_of(account);
    //     let collection = borrow_global_mut<Collection>(addr);
    //     vector::pop_back(&mut collection.items);


    // }


    public fun size(account: &signer):u64 acquires Collection{

        let addr = signer::address_of(account);
        let collection = borrow_global<Collection>(addr);
        vector::length(&collection.items)
    }


    public fun destroy(account: &signer) acquires Collection{
        let addr = signer::address_of(account);
        let collection = move_from<Collection>(addr);
        let Collection{items:_} = collection;
    }


    #[test(account=@0x1)]
    public entry fun start_c(account: signer) acquires Collection{
        MyAddr::Collnn::start_collection(&account);
        let addr = signer::address_of(&account);
        let is = MyAddr::Collnn::exists_at(addr);
        debug::print(&is);
        MyAddr::Collnn::add_item(&account);
        let sizee = MyAddr::Collnn::size(&account);
        debug::print(&sizee);
        MyAddr::Collnn::destroy(&account);
        let is = MyAddr::Collnn::exists_at(addr);
        debug::print(&is);
                MyAddr::Collnn::start_collection(&account);
        MyAddr::Collnn::add_item(&account);
        MyAddr::Collnn::add_item(&account);
        MyAddr::Collnn::add_item(&account);
        MyAddr::Collnn::add_item(&account);




         let sizee = MyAddr::Collnn::size(&account);
        debug::print(&sizee);

    }
}