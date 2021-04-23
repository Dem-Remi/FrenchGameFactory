import Foundation

// Create a class "Wizard"
class Wizard: Character {
    init(name: String) {
        super.init(name: name, life: 10, weapon: Weapon(name: "Stick 🧙🏻‍♂️", damage: 8, repair: 5), type: .wizard)
    }
}
