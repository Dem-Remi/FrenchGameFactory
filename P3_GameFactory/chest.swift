import Foundation

// class chest
class Chest {
    var chest = [Weapon(name: "Flower 🌷", damage: 0, repair: 8),
                 Weapon(name: "Axe 🪓", damage: 6, repair: 2),
                 Weapon(name: "Gun 🔫", damage: 7, repair: 2)]
    
    // We select a random element among the weapons
    func chestRandom() -> Weapon? {
        let round = Int.random(in: 0..<100)
        if round >= 70 { // 30% chance of having a chest
            print("Good job! You have found a chest! 🎁"
                    + "\nIn this chest, a weapon appears randomly and it is given to your character!")
            return chest.randomElement()
        }
        return nil
    }
}
