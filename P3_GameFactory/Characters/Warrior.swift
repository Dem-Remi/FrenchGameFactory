import Foundation

// Create a class "Warrior"
class Warrior: Character {
    init(name: String) {
        super.init(name: name, life: 20, weapon: Weapon(name: "Sword 🗡", damage: 5, repair: 3), type: .warrior)
    }
}
