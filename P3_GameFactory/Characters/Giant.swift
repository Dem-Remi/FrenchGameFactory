import Foundation

// Create a class "Giant"
class Giant: Character {
    init(name: String) {
        super.init(name: name, life: 17, weapon: Weapon(name: "Bowing Glove 🥊", damage: 9, repair: 0), type: .giant)
    }
}
