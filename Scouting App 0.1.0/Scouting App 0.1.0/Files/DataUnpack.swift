//
//  DataUnpack.swift
//  Scouting App 0.1.1
//
//  Created by Carson Ling on 3/28/22.
//

import Foundation


let userDefaults = UserDefaults.standard

var teams: [Team] = load("teamsData.json")
var matches: [Match] = load("matchData.json")

var AutoLowerHub: [Int] = Array(repeating: 0, count: 480)
var AutoStartPos: [Int] = Array(repeating: 0, count: 480)
var AutoUpperHub: [Int] = Array(repeating: 0, count: 480)
var ClimbAttempted: [Bool] = Array(repeating: true, count: 480)
var ClimbLevel: [Int] = Array(repeating: 0, count: 480)
var ClimbSuccessful: [Bool] = Array(repeating: true, count: 480)
var Comments: [String] = Array(repeating: "", count: 480)
var DefenseAbility: [Int] = Array(repeating: 0, count: 480)
var DefensePlayedOn: [Int] = Array(repeating: 0, count: 480)
var DriverLowerHub: [Int] = Array(repeating: 0, count: 480)
var DriverUpperHub: [Int] = Array(repeating: 0, count: 480)
var ExitTarmac: [Bool] = Array(repeating:true, count: 480)
var Fouls: [Int] = Array(repeating: 0, count: 480)
var MatchNum: [Int] = Array(repeating: 0, count: 480)
var Present: [Bool] = Array(repeating: true, count: 480)
var ScoringLocation: [Int] = Array(repeating: 0, count: 480)


var edited: [Bool] = Array(repeating: false, count: 480)

//var initialized = false

//Set initial values to UserDefaults
func initialSave(){
    userDefaults.set(AutoLowerHub, forKey: "AutoLowerHub")
    userDefaults.set(AutoStartPos, forKey: "AutoStartPos")
    userDefaults.set(AutoUpperHub, forKey: "AutoUpperHub")
    userDefaults.set(ClimbAttempted, forKey: "ClimbAttempted")
    userDefaults.set(ClimbLevel, forKey: "ClimbLevel")
    userDefaults.set(ClimbSuccessful, forKey: "ClimbSuccessful")
    userDefaults.set(Comments, forKey: "Comments")
    userDefaults.set(DefenseAbility, forKey: "DefenseAbility")
    userDefaults.set(DefensePlayedOn, forKey: "DefensePlayedOn")
    userDefaults.set(DriverLowerHub, forKey: "DriverLowerHub")
    userDefaults.set(DriverUpperHub, forKey: "DriverUpperHub")
    userDefaults.set(ExitTarmac, forKey: "ExitTarmac")
    userDefaults.set(Fouls, forKey: "Fouls")
    userDefaults.set(MatchNum, forKey: "MatchNum")
    userDefaults.set(Present, forKey: "Present")
    userDefaults.set(ScoringLocation, forKey: "ScoringLocation")
    userDefaults.set(edited, forKey: "edited")
}

//Unpack JSON Data into struct Team or Match
func load<T: Decodable>(_ filename: String) -> T {
//    if (userDefaults.object(forKey: "edited")==nil){
        initialSave()
//    }

    let data : Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func getDocumentDirectory() -> URL {
    let paths=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}


