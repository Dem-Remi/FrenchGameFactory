import Foundation

// Create a class "Archer"
class Archer: Character {
    init(name: String) {
        super.init(name: name, life: 2, weapon: Weapon(name: "Bow 🏹", damage: 7, repair: 2), type: .archer)
    }
}
