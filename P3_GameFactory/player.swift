import Foundation

//Create a classe "Player"
class Player {
    var playerNumber: Int       // This is to identify the player
    var playerName : String     // To personalize the game, each player have a name
    var team = [Character]()    // Player's team
    
    init(playerNumber: Int) {
        self.playerNumber = playerNumber
        self.playerName = ""
    }
    // The players introduce themselves in turn.
    func introduceYourSelf() {
        print("\nHello player n°\(playerNumber)! What is your name?")
        if let playerName = readLine() {
            self.playerName = playerName.capitalized
            print("You're welcome \(playerName).")
        }
    }
    
    // They each create their team and name their characters.
    func createTeam() {
        repeat {
            print("\n\(playerName), choose your character n°\(team.count + 1):"
                    + "\n0. ⚔️ A warrior, with 20LP, 5D & 3R."
                    + "\n1. 🏹 An archer, with 15LP, 7D & 2R."
                    + "\n2. 🧙🏻‍♂️ A wizard, with 10LP, 8D & 5R."
                    + "\n3. 🥊 A giant, with 17LP, 9D & 0R."
                    + "\nInfo: LP for LivePoint, D for Damage & R for Repair")
            if let choice = readLine() {
                switch choice {
                case "0":
                    print("\nWell. What's his name?")
                    // Ask the player to give a name to the chosen character.
                    let name = Character.addName()
                    let character = Warrior(name: name)
                    team.append(character)
                case "1":
                    print("\nWell. What's his name?")
                    let name = Character.addName()
                    let character = Archer(name: name)
                    team.append(character)
                case "2":
                    print("\nWell. What's his name?")
                    let name = Character.addName()
                    let character = Wizard(name: name)
                    team.append(character)
                case "3":
                    print("\nWell. What's his name?")
                    let name = Character.addName()
                    let character = Giant(name: name)
                    team.append(character)
                default:
                    print("\nThis choice is not possible, please try again!")
                }
            }
        } while(team.count < 3)
    }
    
    // Players choose which character to play with.
    func selectCharacter(in team: [Character]) -> Character {
        // Show the list of characters.
        for i in 0..<team.count {
            print("\(i).", team[i].name, "-", team[i].type, "-", team[i].life, "life points", "-", team[i].weapon.name, "-", team[i].weapon.damage, "damage points", "-", team[i].weapon.repair, "repair points")
        }
        if let choiceSelect = readLine() {
            // Check that choiceSelect is an Int.
            if let choiceInt = Int(choiceSelect) {
                // Look if this Int is well understood between 0..<team.count.
                if choiceInt >= 0 && choiceInt < team.count {
                    // We return the character.
                    return team[choiceInt]
                } else {
                    // Number error.
                    print("\nNumber must be between 0 and \(team.count - 1).\n")
                }
            } else {
                // Print error.
                print("\nI don't understand your choice! Please, try again.\n")
            }
        }
        return selectCharacter(in: team)
    }
    
    // Players choose the action of their character according to their possibility.
    func wantToAttack() -> Bool {
        // Check the character type to see the available actions.
        print("\n\(playerName), choose an action for your character:"
                + "\n0. Attack someone from the opposing team!"
                + "\n1. Treat someone from his team or himself!")
        if let choiceAction = readLine() {
            switch choiceAction {
            case "0":
                print("\nYour character will attack an ennemy character. Choose it, please \(playerName):")
                return true
            case "1":
                print("\nYour character will treat a member of his team or himself. Choose it, please \(playerName):")
                return false
            default:
                print("\nI don't understand your choice. Please try again.")
            }
        }
        return wantToAttack()
    }
}
