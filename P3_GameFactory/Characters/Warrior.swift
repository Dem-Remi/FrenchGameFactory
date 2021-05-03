import Foundation

// Create a class "Warrior"
class Warrior: Character {
    
    static let defaultLife = 20
    static let defaultDamage = 5
    static let defaultRepair = 3
    
    init(name: String) {
        super.init(name: name, life: Warrior.defaultLife, weapon: Weapon(name: "Sword 🗡", damage: Warrior.defaultDamage, repair: Warrior.defaultRepair), type: .warrior)
    }
}
