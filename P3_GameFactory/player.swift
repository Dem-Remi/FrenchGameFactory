import Foundation

//Create a classe "Player"
class Player {
    var playerNumber: Int       // This is to identify the player
    var playerName : String     // To personalize the game, each player have a name
    var team = [Character]()    // Player's team
    
    var alivedTeam: [Character] {
        var alived = [Character]()
        for character in team {
            if character.life > 0 {
                alived.append(character)
            }
        }
        return alived
    }
    
    func isAlive() -> Bool {
        for character in team {
            if character.life > 0 { return true }
        }
        return false
    }
    
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
                    + "\n0. 🗡 A warrior, with \(Warrior.defaultLife)LP, \(Warrior.defaultDamage)D & \(Warrior.defaultRepair)R."
                    + "\n1. 🏹 An archer, with \(Archer.defaultLife)LP, \(Archer.defaultDamage)D & \(Archer.defaultRepair)R."
                    + "\n2. 🧙🏻‍♂️ A wizard, with \(Wizard.defaultLife)LP, \(Wizard.defaultDamage)D & \(Wizard.defaultRepair)R."
                    + "\n3. 🥊 A giant, with \(Giant.defaultLife)LP, \(Giant.defaultDamage)D & \(Giant.defaultRepair)R."
                    + "\nInfo: LP LifePoint, D for Damage & R for Repair")
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
        } while team.count < 3
    }
    
    func printTeamDescription() {
        // Show the list of characters.
        for (i, character) in team.enumerated() {
            if character.life > 0 {
                print("\(i).", character.name, "-", character.type, "-", character.life, "life points", "-", character.weapon.name, "-", character.weapon.damage, "damage points", "-", character.weapon.repair, "repair points")
            } else {
                print("\(i).", character.name, "-", character.type,"- DEAD ☠️")
            }
        }
    }
    
    // Players choose which character to play with.
    func selectCharacter() -> Character {
        printTeamDescription()
        
        guard let choiceSelect = readLine(), let choiceInt = Int(choiceSelect) else {  // guard function = guarantee that ... (here 2 conditions)
            print("\nI don't understand your choice! Please, try again.\n") // if the guarantee is not OK, print ...
            return selectCharacter() // and restart the function
        }
        
        guard choiceInt >= 0 && choiceInt < team.count else {
            print("\nNumber must be between 0 and \(team.count - 1).\n")
            return selectCharacter()
        }
        
        let character = team[choiceInt]
        guard character.life > 0 else {
            print("\nCharacter is dead please choose another one.\n")
            return selectCharacter()
        }
        
        return character
        
        /*
         FIRST VERSION, BEFORE TO USE GUARD FUNCTION
         // Check that choiceSelect is an Int.
         if let choiceSelect = readLine(), let choiceInt = Int(choiceSelect) {
         // Look if this Int is well understood between 0..<team.count.
         if choiceInt >= 0 && choiceInt < team.count {
         // We return the character.
         let character = team[choiceInt]
         if character.life > 0 {
         return character
         } else {
         print("\nCharacter is dead please choose another one.\n")
         }
         } else {
         // Number error.
         print("\nNumber must be between 0 and \(team.count - 1).\n")
         }
         } else {
         // Print error.
         print("\nI don't understand your choice! Please, try again.\n")
         }
         
         return selectCharacter()
         */
    }
    
    // Players choose the action of their character according to their possibility.
    func attackOrRepair() -> Bool {
        // Check the character type to see the available actions.
        print("\n\(playerName), choose an action for your character:"
                + "\n0. 🤼‍♀️ Attack someone from the opposing team!"
                + "\n1. 🩹 Heal someone from his team or himself!")
        if let choiceAction = readLine() {
            switch choiceAction {
            case "0":
                print("\nYour character will attack an ennemy. Choose it, please \(playerName):")
                return true
            case "1":
                print("\nYour character will heal a member of his team or himself. Choose it, please \(playerName):")
                return false
            default:
                print("\nI don't understand your choice. Please try again.")
            }
        }
        return attackOrRepair()
    }
}
