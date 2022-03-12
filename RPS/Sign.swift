//
//  Sign.swift
//  RPS
//
//  Created by Mackenzie Willard on 3/12/22.
//

import Foundation

enum Signs{
    case rock
    case paper
    case scissors
    
    var displaySign: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📜"
        case .scissors:
            return "✂️"
        }
    }
}
