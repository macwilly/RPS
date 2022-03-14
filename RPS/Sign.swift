//
//  Sign.swift
//  RPS
//
//  Created by Mackenzie Willard on 3/12/22.
//

import Foundation

func randomSign() -> Signs {
    let sign = Int.random(in: 0...2)
    let signs: [Signs] = [.rock, .paper, .scissor]
    return signs[sign]
}

enum Signs{
    case rock
    case paper
    case scissor
    
    var displaySign: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📜"
        case .scissor:
            return "✂️"
        }
    }
    
    func compareSigns(opponentSign: Signs) -> GameState {
        if self == opponentSign {
            return .draw
        } else if self == .rock && opponentSign == .scissor {
            return .win
        } else if self == .paper && opponentSign == .rock {
            return .win
        } else if self == .scissor && opponentSign == .paper {
            return .win
        } else {
            return .lose
        }
    }
}
