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
    var barOptions = ["0", "5", "10", "15", "50"]
    @State var arr=UserDefaults.standard.object(forKey: "presents") as! [Bool]
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
                
                Section(header: Text("EVALUATION")) {

                    Picker(selection: $team.barIndex, label: Text("Bar Score")) {
                        ForEach(0 ..< barOptions.count) {
                            Text(self.barOptions[$0])
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

        let userDefaults = UserDefaults.standard
        userDefaults.set(presents, forKey: "presents")
        presents=userDefaults.object(forKey: "presents") as! [Bool]
    }
    func getDocumentDirectory() -> URL {
        let paths=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
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


