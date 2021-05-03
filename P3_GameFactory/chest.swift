import Foundation

// class chest
class Chest {
    var chest = [Weapon(name: "Flower 🌷", damage: 0, repair: 10),
                 Weapon(name: "Axe 🪓", damage: 6, repair: 2),
                 Weapon(name: "Gun 🔫", damage: 7, repair: 2),
                 Weapon(name: "Candlestick 🕯", damage: 5, repair: 4),
                 Weapon(name: "Syringe 💉", damage: 7, repair: 7)]
    
    // We select a random element among the weapons
    func chestRandom() -> Weapon? {
        let round = Int.random(in: 0..<100)
        if round >= 70 { // 30% chance of having a chest
            print("🎁 Hoho! There is magic in the air: a chest has appeared! 🎁"
                    + "\nIn this chest, a weapon appears randomly and it is given to your character!")
            return chest.randomElement()
        }
        return nil
    }
}

