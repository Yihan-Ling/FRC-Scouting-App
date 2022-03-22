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
    var matchNum: Int
    var present: Bool
    var barIndex: Int
    var ballScore: Int
    var auBScore: Int
    var auLeave: Bool
    var cargoScore: Int
    var climbScore: Int
}
