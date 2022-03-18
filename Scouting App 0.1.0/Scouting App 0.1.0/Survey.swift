//
//  Form.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/11/22.
//


import SwiftUI

struct Survey: View {
    @State var team: Team
//    let defaults = UserDefaults.standard
//    @AppStorage("present") var present = true
//    $team.present=
    var climbOption = [0, 4, 6, 10, 15]
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    
    var body: some View {
        
        VStack{
            Text("Survey")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Form {
                TextField("Username", text: $team.id)
                Toggle("Present", isOn: $team.present)
//                $present = $team.present
//               UserDefaults.standard.set($team.present, forKey: "email")
                Section(header: Text("Auton")){
                    Stepper(value: $team.auBScore,
                            in: 0...100,
                            label: {
                        Text("How many points did they score from balls in autonomous (4 for high 2 for low):  \(self.team.auBScore)")
                    })
                    Toggle("Did they leave the tarmac in autonomous", isOn: $team.auLeave)
                }
                Section(header: Text("EVALUATION")) {
                    
                    Stepper(value: $team.cargoScore,
                            in: 0...100,
                            label: {
                        Text("How many points did they score from cargo (not including autonomous):  \(self.team.cargoScore)")
                    })
                    
                    Picker(selection: $team.climbScore, label: Text("Climbing points")) {
                        ForEach(0 ..< climbOption.count) {
                            Text(String(self.climbOption[$0]))
                        }
                    }
                    
                    Stepper(value: $team.ballScore,
                            in: 0...100,
                            label: {
                        Text("Lower Hub Score:  \(self.team.ballScore)")
                    })
                    
                }
                Section(header: Text("INFO")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("#2")
                    }
                }
                
//                Section {
//                    Button(action: {
//                        save()
//                    }) {
//                        Text("Submit")
//                    }
//                    NavigationLink(destination: SaveResult(team: team)) {
//                        Text("Submit")
//                            .font(.headline)
//                            .multilineTextAlignment(.center)
//                    }
                Button("Save"){
                    save(team:team)
                }
//                }
                
            }
//            .navigationBarTitle("Survey")
        }
        
    }
    func save(team:Team){
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
//    func getDocumentDirectory() -> URL {
//        let paths=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//    
//    func save() -> String{
//
//        let str = "Test"
//        let url = getDocumentDirectory().appendingPathComponent("message.txt")
//        let input = "No change"
//        do{
//            try str.write(to: url, atomically: true, encoding: .utf8)
//            let input = try String(contentsOf: url)
//            return(input)
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//        return(input)
//    }
//    func save (team: String, present:Bool, barScore:Int, ballScore:Int) -> (team: String, present: Bool, barScore: Int, ballScore: Int){
//        
//    }
}

struct Survey_Previews: PreviewProvider {
    static var previews: some View {
        Survey(team:teams[0])
    }
}


