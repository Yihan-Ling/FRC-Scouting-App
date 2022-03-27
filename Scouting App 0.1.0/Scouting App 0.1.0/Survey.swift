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
                Toggle("Present", isOn: $match.present)
                Section(header: Text("Auton")){
                    Stepper(value: $match.auBScore,
                            in: 0...100,
                            label: {
                        Text("How many points did they score from balls in autonomous (4 for high 2 for low):  \(self.match.auBScore)")
                    })
                    Toggle("Did they leave the tarmac in autonomous", isOn: $match.auLeave)
                }
                Section(header: Text("EVALUATION")) {
                    
                    Stepper(value: $match.cargoScore,
                            in: 0...100,
                            label: {
                        Text("How many points did they score from cargo (not including autonomous):  \(self.match.cargoScore)")
                    })
                    
                    Picker(selection: $match.climbScore, label: Text("Climbing points")) {
                        ForEach(0 ..< climbOption.count) {
                            Text(String(self.climbOption[$0]))
                        }
                    }
                    
                    Stepper(value: $match.ballScore,
                            in: 0...100,
                            label: {
                        Text("Lower Hub Score:  \(self.match.ballScore)")
                    })
                    
                }
                Button("Save"){
                    save(match:match)
                }
                
            }
        }
        
    }
    
    //Save survey result to userDefaults
    func save(match:Match){
        let matchIndex = (match.index*3)+match.matchNum
        presents[matchIndex]=match.present
        auBScore[matchIndex]=match.auBScore
        auLeave[matchIndex]=match.auLeave
        cargoScore[matchIndex]=match.cargoScore
        climbScore[matchIndex]=climbOption[match.climbScore]
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

struct Survey_Previews: PreviewProvider {
    static var previews: some View {
        Survey(team:teams[0], match: matches[0])
    }
}


