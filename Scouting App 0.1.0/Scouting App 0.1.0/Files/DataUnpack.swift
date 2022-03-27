//
//  DataUnpack.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/9/22.
//

import Foundation


let userDefaults = UserDefaults.standard

var teams: [Team] = load("teamsData.json")
var matches: [Match] = load("matchData.json")
var presents: [Bool] = Array(repeating: true, count: 9)
var auBScore: [Int] = Array(repeating: 0, count: 9)
var auLeave: [Bool] = Array(repeating: false, count: 9)
var cargoScore: [Int] = Array(repeating: 0, count: 9)
var climbScore: [Int] = Array(repeating: 0, count: 9)
var climbOption: [Int] = Array(repeating: 0, count: 9)
var initialized = false

//Set initial values to UserDefaults
func initialSave(){
    userDefaults.set(presents, forKey: "presents")
    presents=userDefaults.object(forKey: "presents") as! [Bool]
    userDefaults.set(auBScore, forKey: "auBScore")
    auBScore=userDefaults.object(forKey: "auBScore") as! [Int]
    userDefaults.set(auLeave, forKey: "auLeave")
    auLeave=userDefaults.object(forKey: "auLeave") as! [Bool]
    userDefaults.set(cargoScore, forKey: "cargoScore")
    cargoScore=userDefaults.object(forKey: "cargoScore") as! [Int]
    userDefaults.set(climbScore, forKey: "climbScore")
    climbScore=userDefaults.object(forKey: "climbScore") as! [Int]
    initialized = true
}

//Unpack JSON Data into struct Team or Match
func load<T: Decodable>(_ filename: String) -> T {
    if (userDefaults.object(forKey: "presents")==nil){
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


