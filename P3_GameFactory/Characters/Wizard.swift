import Foundation

// Create a class "Wizard"
class Wizard: Character {
    
    static let defaultLife = 10
    static let defaultDamage = 8
    static let defaultRepair = 5
    
    init(name: String) {
        super.init(name: name, life: Wizard.defaultLife, weapon: Weapon(name: "Stick 🧙🏻‍♂️", damage: Wizard.defaultDamage, repair: Wizard.defaultRepair), type: .wizard)
    }
}
