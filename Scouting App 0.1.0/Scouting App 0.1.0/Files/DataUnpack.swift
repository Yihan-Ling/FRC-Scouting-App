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


var TeamID: [String] = []
var AutoLowerHub: [Int] = []
var AutoStartPos: [Int] = []
var AutoUpperHub: [Int] = []
var ClimbAttempted: [Bool] = []
var ClimbLevel: [Int] = []
var ClimbSuccessful: [Bool] = []
var Comments: [String] = []
var DefenseAbility: [Int] = []
var DefensePlayedOn: [Int] = []
var DriverLowerHub: [Int] = []
var DriverUpperHub: [Int] = []
var ExitTarmac: [Bool] = []
var Fouls: [Int] = []
var MatchNum: [Int] = []
var Present: [Bool] = []
var ScoringLocation: [Int] = []
var edited: [Bool] = Array(repeating: false, count: 480)

var MatchIndex: [Int] = Array(repeating: 0, count: 480)

var lastEdited:  [Int] = Array(repeating: 0, count: 40)


//var initialized = false

//Set initial values to UserDefaults
func initialSave(){
    
    userDefaults.set(TeamID, forKey: "TeamID")
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
    userDefaults.set(MatchIndex, forKey: "MatchIndex")
    userDefaults.set(lastEdited, forKey: "lastEdited")
}

//Unpack JSON Data into struct Team or Match
func load<T: Decodable>(_ filename: String) -> T {
    if (userDefaults.object(forKey: "TeamID")==nil){
        initialSave()
    }
    
    

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


