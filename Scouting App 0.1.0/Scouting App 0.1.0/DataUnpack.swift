//
//  DataUnpack.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/9/22.
//

import Foundation

var teams: [Team] = load("teamsData.json")
var presents: [Bool] = [true, true, true, true]
var auBScore: [Int] = [0,0,0]
var auLeave: [Bool] = [false,false,false]
var cargoScore: [Int] = [0,0,0]
var climbScore: [Int] = [0,0,0]
var climbOption: [Int] = [0,0,0]

func initialSave(team:Team){
    for team in teams{
        presents[team.index]=team.present
        teams[team.index].barIndex=team.barIndex
        teams[team.index].ballScore=team.ballScore
        auBScore[team.index]=team.auBScore
        auLeave[team.index]=team.auLeave
        cargoScore[team.index]=team.cargoScore
        climbScore[team.index]=climbOption[team.climbScore]
        let userDefaults = UserDefaults.standard
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
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
//    let url = getDocumentDirectory().appendingPathComponent(filename)
    let data : Data
//    do{
//        try data=Data(contentsOf: url)
//
//    } catch{
//        print(error.localizedDescription)
//    }
   
//        do{
//            data = try Data(contentsOf: url)
//        }
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


