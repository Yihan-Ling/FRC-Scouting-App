//
//  GeneralSurvey.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 4/4/22.
//

import SwiftUI

struct GeneralSurvey: View {
    @State var teamid: String = ""
    @State var present: Bool = true
    @State var matchnum: Int = 0
    @State var autostart: Int = 0
    @State var autolow: Int = 0
    @State var autohigh: Int = 0
    @State var tarmac: Bool = true
    @State var driverlow: Int = 0
    @State var driverhigh: Int = 0
    @State var climbattpeted: Bool = true
    @State var climbsuccess: Bool = true
    @State var climblevel: Int = 0
    @State var defenseability: Int = 0
    @State var defenseplayedon: Int = 0
    @State var comments: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        VStack{
            Text("Survey")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Form {
                TextField("Team id", text: $teamid)
                Toggle("Present", isOn: $present)
                TextField("Match Number", value: $matchnum, format: .number)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
                Section(header: Text("Autonomous")){
                    TextField("Autonomous Starting Position", value: $autostart, format: .number)
//                        .keyboardType(.numberPad)
                    Stepper(value: $autolow,
                            in: 0...100,
                            label: {
                        Text("Autonomous Lower Hub Score:   \(self.autolow)")
                    })
                    Stepper(value: $autohigh,
                            in: 0...100,
                            label: {
                        Text("Autonomous Upper Hub Score:   \(self.autohigh)")
                    })
                    Toggle("Did they leave the tarmac in autonomous", isOn: $tarmac)
                }
                Section(header: Text("Driver Control")) {
                    
                    Stepper(value: $driverlow,
                            in: 0...100,
                            label: {
                        Text("Driver Control Lower Hub Score:  \(self.driverlow)")
                    })
                    
                    Stepper(value: $driverhigh,
                            in: 0...100,
                            label: {
                        Text("Driver Control Upper Hub Score:  \(self.driverhigh)")
                    })
                    
                    Toggle("Was Climb Attempted", isOn: $climbattpeted)
                    Toggle("Was Climb Successful", isOn: $climbsuccess)
                    
                    TextField("Climb Level", value: $climblevel, format: .number)
//                        .keyboardType(.numberPad)
                    
                }
                
                
                Section(header: Text("End Game")) {
                    TextField("Defense Ability (1-10)", value: $defenseability, format: .number)
//                        .keyboardType(.numberPad)
                    TextField("How Much Defense Was Played On Them (1-10)", value: $defenseplayedon, format: .number)
//                        .keyboardType(.numberPad)
                    TextField("Comments", text: $comments)
                }
                
                
                Button("Save"){
                    save()
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("saved"))
                }

            }
        }
        
    }
    
    //Save survey result to userDefaults
    func save(){
        showAlert.toggle()
        
        let userDefaults = UserDefaults.standard
//        var teamIdToIndex: Dictionary <String, Int>=[:]
//        for team in teams{
//            teamIdToIndex[team.id]=team.index
//        }
//
//        let i:Int = teamIdToIndex[teamid]!
//
//        var MatchIndex=userDefaults.object(forKey: "MatchIndex") as! [Int]
//
//        let matchIndex = (teams[i].index*12)+MatchIndex[i]
//        MatchIndex[i]+=1
//        userDefaults.set(MatchIndex, forKey: "MatchIndex")
        
        
        var AutoLowerHub=UserDefaults.standard.object(forKey: "AutoLowerHub") as! [Int]
        var AutoStartPos=UserDefaults.standard.object(forKey: "AutoStartPos") as! [Int]
        var AutoUpperHub=UserDefaults.standard.object(forKey: "AutoUpperHub") as! [Int]
        var ClimbAttempted=UserDefaults.standard.object(forKey: "ClimbAttempted") as! [Bool]
        var ClimbLevel=UserDefaults.standard.object(forKey: "ClimbLevel") as! [Int]
        var ClimbSuccessful=UserDefaults.standard.object(forKey: "ClimbSuccessful") as! [Bool]
        var Comments=UserDefaults.standard.object(forKey: "Comments") as! [String]
        var DefenseAbility=UserDefaults.standard.object(forKey: "DefenseAbility") as! [Int]
        var DefensePlayedOn=UserDefaults.standard.object(forKey: "DefensePlayedOn") as! [Int]
        var DriverLowerHub=UserDefaults.standard.object(forKey: "DriverLowerHub") as! [Int]
        var DriverUpperHub=UserDefaults.standard.object(forKey: "DriverUpperHub") as! [Int]
        var ExitTarmac=UserDefaults.standard.object(forKey: "ExitTarmac") as! [Bool]
        var Fouls=UserDefaults.standard.object(forKey: "Fouls") as! [Int]
        var MatchNum=UserDefaults.standard.object(forKey: "MatchNum") as! [Int]
        var Present=UserDefaults.standard.object(forKey: "Present") as! [Bool]
        var ScoringLocation=UserDefaults.standard.object(forKey: "ScoringLocation") as! [Int]
        var TeamID=UserDefaults.standard.object(forKey: "TeamID") as! [String]
        
        
        TeamID += [teamid]
        AutoLowerHub += [autolow]
        AutoStartPos += [autostart]
        AutoUpperHub += [autohigh]
        ClimbAttempted += [climbattpeted]
        ClimbLevel += [climblevel]
        ClimbSuccessful += [climbsuccess]
        Comments += [comments]
        DefenseAbility += [defenseability]
        DefensePlayedOn += [defenseplayedon]
        DriverLowerHub += [driverlow]
        DriverUpperHub += [driverhigh]
        ExitTarmac += [tarmac]
//        Fouls[matchIndex] = fouls
        MatchNum += [matchnum]
        Present += [present]
//        ScoringLocation = [
        
        
       

        
//        edited[matchIndex] = true
//        userDefaults.set(edited, forKey: "edited")
        
        userDefaults.set(TeamID, forKey: "TeamID")
        TeamID=userDefaults.object(forKey: "TeamID") as! [String]
        
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
        
//        userDefaults.set(ScoringLocation, forKey: "ScoringLocation")
//        ScoringLocation=userDefaults.object(forKey: "ScoringLocation") as! [Int]
        print(ClimbLevel)
       
    }


}

struct GeneralSurvey_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSurvey()
    }
}
