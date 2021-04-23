import Foundation

// class chest
class Chest {
    var chest = [Weapon(name: "Flower 🌷", damage: 0, repair: 8),
                 Weapon(name: "Axe 🪓", damage: 6, repair: 2),
                 Weapon(name: "Gun 🔫", damage: 7, repair: 2)]
    
    // We select a random element among the weapons
    let chestRandom = Int(arc4random_uniform(UInt32(chest.count)))
}
