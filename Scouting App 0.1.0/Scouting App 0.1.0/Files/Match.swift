//
//  Match.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//

import Foundation

struct Match: Hashable, Codable, Identifiable{
    var id: String
    var index: Int
    var matchIndex: Int
    var AutoLowerHub: Int
    var AutoStartPos: Int
    var AutoUpperHub: Int
    var ClimbAttempted: Bool
    var ClimbLevel: Int
    var ClimbSuccessful: Bool
    var Comments: String
    var DefenseAbility: Int
    var DefensePlayedOn: Int
    var DriverLowerHub: Int
    var DriverUpperHub: Int
    var ExitTarmac: Bool
    var Fouls: Int
    var MatchNum: Int
    var Present: Bool
    var ScoringLocation: Int
}
