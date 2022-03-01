//
//  DataUnpack.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/9/22.
//

import Foundation

var teams: [Team] = load("teamsData.json")
var presents: [Bool] = [true, true, true, true]

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


