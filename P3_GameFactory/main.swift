import Foundation

//On veut faire un jeu. ==> class Game
//Le jeu est composé de 2 équipes. ===> class Team ; Game <>--- Team
//Chaque équipe comprend 3 personnages ===> class Character; Team <>- Character
//Chaque personnage a des points de vie (Int), un nom unique (String) et une arme (class Weapon).
//    Personnages :
//        Warrior : Warrior ---> Character
//            - pv = 20
//            - arme = épée: Sword ---> Weapon
//            - dégats = 5
//        Archer : Archer ---> Character
//            - pv = 15
//            - arme = arc : Arc ---> Weapon
//            - dégats = 7
//        Sorcier : Sorcier ---> Character
//            - pv = 10
//            - arme : bâton: Stick ---> Weapon
//            - dégats = 8
//        Géant :
//            - pv = 17
//            - arme : gant de boxe: Boxing glove ---> Weapon
//            - dégats = 9


//======================
// MARK: - Game
//======================

// In the game, there are two players identified by their number.
var game = Game(player1: Player(playerNumber: 1), player2: Player(playerNumber: 2))
// The game starts.
game.startMenu()


class Game {
    var player1: Player
    var player2: Player
    var numberOfRounds: Int = 0
    
    init (player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    // The game start with an introduction & a confirmation from players.
    func startMenu() {
        introduction()
        confirmation()
    }
    
    // The players are ready, the game can start.
    func startGame() {
        // The players introduce themselves in turn.
        player1.introduceYourSelf()
        player2.introduceYourSelf()
        
        // They each create their team and name their characters.
        player1.createTeam()
        player2.createTeam()
        
        // The fight starts. The players attack each other in turn until there is only one team left with one or more players.
        repeat {
            fight(attackingPlayer: player1, defendingPlayer: player2)
            if player2.team.count > 0 {
                fight(attackingPlayer: player2, defendingPlayer: player1)
            }
            numberOfRounds += 1
        } while player1.team.count > 0 && player2.team.count > 0
        endGame()
    }
    
    // The name of the winner is announced as well as the number of turns and the list of characters with their properties (life point, etc.).
    func endGame() {
        if player1.team.count <= 0 {
            print("\n🏆 And the winner iiiissssss \(player2.playerName) in \(numberOfRounds) rounds! 🏆"
                    + "\nThe survivor(s) of your team are:")
            for i in 0..<player2.team.count {
                print("\(i).", player2.team[i].name, "-", player2.team[i].type, "-", player2.team[i].life, "life points", "-", player2.team[i].weapon.name)
            }
        } else if player2.team.count <= 0 {
            print("\nAnd the winner is \(player1.playerName) in \(numberOfRounds) rounds!"
                    + "\nThe survivor(s) of your team are:")
            for i in 0..<player1.team.count {
                print("\(i).", player1.team[i].name, "-", player1.team[i].type, "-", player1.team[i].life, "life points", "-", player1.team[i].weapon.name)
            }
        }
    }
    
    // Introduction before the game.
    func introduction() {
        print("Hi guys! The French Factory Game is very happy to welcome you in THE game of the year")
    }
    
    // A confirmation by player is requested to start game.
    func confirmation() {
        var confirm = true
        repeat {
            print("Would like to play?" //ask to the player if he want to play
                    + "\nYes or Not [y/n]") // an answer is required
            if let playerChoice = readLine() {  // We get the user's response
                switch playerChoice {
                case "y": //Want to play
                    print("Let's go!")
                    self.startGame()
                case "n": //Don't want to play
                    print("See you next time!\n")
                    confirm = false
                default: //Answer is not y or n
                    print("I don't undersant your answer. Please try again.")
                }
            }
        } while confirm
        exit(0)
    }
    
    //======================
    // MARK: - Fight
    //======================
    
    // This is the fight phase. There are an attacker and a defender.
    func fight(attackingPlayer: Player, defendingPlayer: Player) {
        print("\n\(attackingPlayer.playerName), choose a character for play:")
        let attacker = attackingPlayer.selectCharacter(in: attackingPlayer.team)
        let attack = attackingPlayer.wantToAttack()
        if attack {
            let defenser = attackingPlayer.selectCharacter(in: defendingPlayer.team)
            attacker.giveDamage(target: defenser)
            if defenser.life <= 0 {
                let index = defendingPlayer.team.firstIndex(where: {$0 === defenser})
                defendingPlayer.team.remove(at: index!)
            }
        }
        else {
            let target = attackingPlayer.selectCharacter(in: attackingPlayer.team)
            attacker.giveRepair(target: target)
        }
    }
    
    
    
    // Reset informations before new game.
    func reset() {
        numberOfRounds = 0
        Character.names = []
        self.player1.team = []
        self.player2.team = []
    }
}
