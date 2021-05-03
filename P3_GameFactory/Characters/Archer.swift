import Foundation

// Create a class "Archer"
class Archer: Character {
    
    static let defaultLife = 15
    static let defaultDamage = 7
    static let defaultRepair = 3
    
    init(name: String) {
        super.init(name: name, life: Archer.defaultLife, weapon: Weapon(name: "Bow 🏹", damage: Archer.defaultDamage, repair: Archer.defaultRepair), type: .archer)
    }
}
