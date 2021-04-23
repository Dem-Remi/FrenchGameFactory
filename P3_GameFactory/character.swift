import Foundation

// Create a "Type" enumeration for each character that has its own type.
enum Type {
    case warrior
    case archer
    case wizard
    case giant
}

// Create a class Character.
class Character {
    var name: String        // The character has a name.
    var life: Int           // The character has life points.
    var weapon: Weapon      // The character has a weapon.
    var type: Type          // The character has a type.
    
    // The names assigned to the character are in a array in order to check that there are unique.
    static var names = [String]()
    
    init(name: String, life: Int, weapon: Weapon, type: Type) {
        self.name = name.capitalized
        self.life = life
        self.weapon = weapon
        self.type = type
    }
    
    // The player gives a unique name to his character.
    static func addName() -> String {
        if let name = readLine() {
            if !Character.names.contains(name.uppercased()) {
                Character.names.append(name.uppercased())
                return name
            } else {
                print("\n❌ This name is already taken, choose another name.")
            }
        }
        return addName()
    }
    
    // The player inflict damage on an opposing team's characters.
    func giveDamage(target: Character) {
        target.life -= self.weapon.damage
        if target.life <= 0 {
            print("\n☠️ Your character is dead.")
        } else {
            print("\nAfter that, the character's life is: \(target.life) points.")
        }
    }
    
    // Or heal someone on his team.
    func giveRepair(target: Character) {
        target.life += self.weapon.repair
        if target.life <= 0 {
            print("\n☠️ Your character is dead.")
        } else {
            print("\nAfter that, the character's life is: \(target.life) points.")
        }
    }
}

