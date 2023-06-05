//
//  Tattoo.swift
//  InkSpot
//
//  Created by Lori Rothermel on 6/4/23.
//

import Foundation


enum Location: String, Codable, CaseIterable {
    case face, neck, torso, back, left_arm, right_arm, left_leg, right_leg
        
    func emoji() -> String {
        switch self {
            case .face:
                return "😁"
            case .neck:
                return "🦒"
            case .torso:
                return "👕"
            case .back:
                return "🔙"
            case .left_arm:
                return "💪"
            case .right_arm:
                return "💪🏿"
            case .left_leg:
                return "🦵"
            case .right_leg:
                return "🦿"
        }
    }  // emoji
}  // enum


struct Tattoo: Identifiable, Codable {
           
    var id: String?
    var description = ""
    var location: Location = .torso
    var notes = ""
    
}
