//
//  NextView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//

import SwiftUI

struct Handle: View {
    var scannedCode: String
    var match: Match
    
    var body: some View {
        VStack{
            Text(scannedCode)
            Text(save(match: match))
        }
    }
    
    func save(match:Match)->String {
        let message = "Saved!!!"
        let components = scannedCode.components(separatedBy: "\n")
        let matchIndex = (match.index*3)+match.matchNum
        
        presents[matchIndex] = (components[0] == "true")
        auBScore[matchIndex] = Int(components[1])!
        auLeave[matchIndex] = (components[2] == "true")
        cargoScore[matchIndex]=Int(components[3])!
        climbScore[matchIndex]=Int(components[4])!
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
        return message
    }
    
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle(scannedCode:"hello", match: matches[0])
    }
}
