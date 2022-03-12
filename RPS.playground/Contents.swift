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


