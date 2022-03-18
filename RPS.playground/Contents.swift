import UIKit

enum Sign {
    case rock
    case paper
    case scissor
    
    func compareSigns(oppoentSign: Sign) -> GameState {
        if self == oppoentSign {
            return .draw
        } else if self == .rock && oppoentSign == .scissor {
            return .win
        } else if self == .paper && oppoentSign == .rock {
            return .win
        } else if self == .scissor && oppoentSign == .paper {
            return .win
        } else {
            return .lose
        }
        
    }
}

enum GameState {
    case start
    case win
    case lose
    case draw
}




func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    let signs: [Sign] = [.rock, .paper, .scissor]
    return signs[sign]
}

let opp1 = randomSign()
let opp2 = randomSign()
let opp3 = randomSign()
