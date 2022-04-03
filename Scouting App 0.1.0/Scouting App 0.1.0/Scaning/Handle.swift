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
        let matchIndex = (match.index*3)+match.matchIndex
        
        AutoLowerHub[matchIndex] = Int(components[0])!
        AutoStartPos[matchIndex] = Int(components[1])!
        AutoUpperHub[matchIndex] = Int(components[2])!
        ClimbAttempted[matchIndex] = (components[3] == "true")
        ClimbLevel[matchIndex] = Int(components[4])!
        ClimbSuccessful[matchIndex] = (components[5] == "true")
        Comments[matchIndex] = (components[6])
        DefenseAbility[matchIndex] = Int(components[7])!
        DefensePlayedOn[matchIndex] = Int(components[8])!
        DefenseAbility[matchIndex] = Int(components[9])!
        DriverLowerHub[matchIndex] = Int(components[10])!
        DriverUpperHub[matchIndex] = Int(components[11])!
        ExitTarmac[matchIndex] = (components[12] == "true")
        Fouls[matchIndex] = Int(components[13])!
        MatchNum[matchIndex] = Int(components[14])!
        Present[matchIndex] = (components[15] == "true")
        ScoringLocation[matchIndex] = Int(components[116])!
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(AutoLowerHub, forKey: "AutoLowerHub")
        AutoLowerHub=userDefaults.object(forKey: "AutoLowerHub") as! [Int]
        
        userDefaults.set(AutoStartPos, forKey: "AutoStartPos")
        AutoStartPos=userDefaults.object(forKey: "AutoStartPos") as! [Int]
        
        userDefaults.set(AutoUpperHub, forKey: "AutoUpperHub")
        AutoUpperHub=userDefaults.object(forKey: "AutoUpperHub") as! [Int]
        
        userDefaults.set(ClimbAttempted, forKey: "ClimbAttempted")
        ClimbAttempted=userDefaults.object(forKey: "ClimbAttempted") as! [Bool]
        
        userDefaults.set(ClimbLevel, forKey: "ClimbLevel")
        ClimbLevel=userDefaults.object(forKey: "ClimbLevel") as! [Int]
        
        userDefaults.set(ClimbSuccessful, forKey: "ClimbSuccessful")
        ClimbSuccessful=userDefaults.object(forKey: "ClimbSuccessful") as! [Bool]
        
        userDefaults.set(Comments, forKey: "Comments")
        Comments=userDefaults.object(forKey: "Comments") as! [String]
        
        userDefaults.set(DefenseAbility, forKey: "DefenseAbility")
        DefenseAbility=userDefaults.object(forKey: "DefenseAbility") as! [Int]
        
        userDefaults.set(DefensePlayedOn, forKey: "DefensePlayedOn")
        DefensePlayedOn=userDefaults.object(forKey: "DefensePlayedOn") as! [Int]
        
        userDefaults.set(DriverLowerHub, forKey: "DriverLowerHub")
        DriverLowerHub=userDefaults.object(forKey: "DriverLowerHub") as! [Int]
        
        userDefaults.set(DriverUpperHub, forKey: "DriverUpperHub")
        DriverUpperHub=userDefaults.object(forKey: "DriverUpperHub") as! [Int]
        
        userDefaults.set(ExitTarmac, forKey: "ExitTarmac")
        ExitTarmac=userDefaults.object(forKey: "ExitTarmac") as! [Bool]
        
        userDefaults.set(Fouls, forKey: "Fouls")
        Fouls=userDefaults.object(forKey: "Fouls") as! [Int]
        
        userDefaults.set(MatchNum, forKey: "MatchNum")
        MatchNum=userDefaults.object(forKey: "MatchNum") as! [Int]
        
        userDefaults.set(Present, forKey: "Present")
        Present=userDefaults.object(forKey: "Present") as! [Bool]
        
        userDefaults.set(ScoringLocation, forKey: "ScoringLocation")
        ScoringLocation=userDefaults.object(forKey: "ScoringLocation") as! [Int]
        return message
    }
    
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle(scannedCode:"hello", match: matches[0])
    }
}
