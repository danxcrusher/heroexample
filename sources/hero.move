module hero::hero {
    use std::string::String;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};
    
    public struct Hero has key, store {
        id: UID,
        name:String,
        power:u64,
        image_url: String,
    
    }

    #[allow(lint(self_transfer))]
    public entry fun create_hero(name: String, image_url: String, power: u64,  ctx: &mut TxContext) {
        let hero = Hero{
            id: object::new(ctx),
            name,
            power,
            image_url
        };
            transfer::transfer(hero, ctx.sender())

    }

    public entry fun transfer_hero(hero: Hero, to: address){
        transfer::public_transfer(hero, to)
    }
}