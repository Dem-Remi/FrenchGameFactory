import Foundation

// Create a class "Weapon".
class Weapon {
    let name: String   // A weapon has a name.
    let damage: Int    // It has a number of damage.
    let repair: Int    // It has a number of repair.
    // Each weapon is a function of the chosen character.
    init(name: String, damage: Int, repair: Int) {
        self.name = name
        self.damage = damage
        self.repair = repair
    }
}
