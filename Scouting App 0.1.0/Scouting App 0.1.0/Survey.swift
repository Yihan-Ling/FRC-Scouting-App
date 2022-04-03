//
//  Survey.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/11/22.
//


import SwiftUI

struct Survey: View {
    @State var team: Team
    @State var match: Match
    var climbOption = [0, 4, 6, 10, 15]
    
    var body: some View {
        
        VStack{
            Text("Survey")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Form {
                TextField("Username", text: $team.id)
                Toggle("Present", isOn: $match.Present)
                TextField("Match Number", value: $match.MatchNum, format: .number)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
                Section(header: Text("Autonomous")){
                    TextField("Autonomous Starting Position", value: $match.AutoStartPos, format: .number)
//                        .keyboardType(.numberPad)
                    Stepper(value: $match.AutoLowerHub,
                            in: 0...100,
                            label: {
                        Text("Autonomous Lower Hub Score:   \(self.match.AutoLowerHub)")
                    })
                    Stepper(value: $match.AutoUpperHub,
                            in: 0...100,
                            label: {
                        Text("Autonomous Upper Hub Score:   \(self.match.AutoUpperHub)")
                    })
                    Toggle("Did they leave the tarmac in autonomous", isOn: $match.ExitTarmac)
                }
                Section(header: Text("Driver Control")) {
                    
                    Stepper(value: $match.DriverLowerHub,
                            in: 0...100,
                            label: {
                        Text("Driver Control Lower Hub Score:  \(self.match.DriverLowerHub)")
                    })
                    
                    Stepper(value: $match.DriverUpperHub,
                            in: 0...100,
                            label: {
                        Text("Driver Control Upper Hub Score:  \(self.match.DriverUpperHub)")
                    })
                    
                    Toggle("Was Climb Attempted", isOn: $match.ClimbAttempted)
                    Toggle("Was Climb Successful", isOn: $match.ClimbSuccessful)
                    
                    TextField("Climbing Score", value: $match.ClimbLevel, format: .number)
                        .keyboardType(.numberPad)
                    
                }
                
                
                Section(header: Text("End Game")) {
                    TextField("Defense Ability (1-10)", value: $match.DefenseAbility, format: .number)
//                        .keyboardType(.numberPad)
                    TextField("How Much Defense Was Played On Them (1-10)", value: $match.DefensePlayedOn, format: .number)
//                        .keyboardType(.numberPad)
                    TextField("Comments", text: $match.Comments)
                }
                
                
                Button("Save"){
                    save(match:match)
                }

            }
        }
        
    }
    
    //Save survey result to userDefaults
    func save(match:Match){
        let matchIndex = (match.index*6)+match.matchIndex
        AutoLowerHub[matchIndex] = match.AutoLowerHub
        AutoStartPos[matchIndex] = match.AutoStartPos
        AutoUpperHub[matchIndex] = match.AutoUpperHub
        ClimbAttempted[matchIndex] = match.ClimbAttempted
        ClimbLevel[matchIndex] = match.ClimbLevel
        ClimbSuccessful[matchIndex] = match.ClimbSuccessful
        Comments[matchIndex] = match.Comments
        DefenseAbility[matchIndex] = match.DefenseAbility
        DefensePlayedOn[matchIndex] = match.DefensePlayedOn
        DriverLowerHub[matchIndex] = match.DriverLowerHub
        DriverUpperHub[matchIndex] = match.DriverUpperHub
        ExitTarmac[matchIndex] = match.ExitTarmac
        Fouls[matchIndex] = match.Fouls
        MatchNum[matchIndex] = match.MatchNum
        Present[matchIndex] = match.Present
        ScoringLocation[matchIndex] = match.ScoringLocation
        
        
       
        let userDefaults = UserDefaults.standard
        
        
        edited[matchIndex] = true
        userDefaults.set(edited, forKey: "edited")
        
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
    }


}

struct Survey_Previews: PreviewProvider {
    static var previews: some View {
        Survey(team:teams[0], match: matches[0])
    }
}


