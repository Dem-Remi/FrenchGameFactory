import Foundation

// Create a class "Giant"
class Giant: Character {
    
    static let defaultLife = 17
    static let defaultDamage = 9
    static let defaultRepair = 0
    
    init(name: String) {
        super.init(name: name, life: Giant.defaultLife, weapon: Weapon(name: "Bowing Glove 🥊", damage: Giant.defaultDamage, repair: Giant.defaultRepair), type: .giant)
    }
}
