//
//  GameState.swift
//  RPS
//
//  Created by Mackenzie Willard on 3/12/22.
//

import Foundation
import UIKit

enum GameState{
    case start
    case win
    case lose
    case draw
    
    var stateMessage: String {
        switch self {
        case .start:
            return "Pick a sign"
        case .win:
            return "You won congradulations"
        case .lose:
            return "You lost, Play again?"
        case .draw:
            return "It was a draw."
        }
    }
    
    var stateColor: UIColor{
        switch self {
        case .start:
            return .white
        case .win:
            return .green
        case .lose:
            return .red
        case .draw:
            return .yellow
        }
    }
}
