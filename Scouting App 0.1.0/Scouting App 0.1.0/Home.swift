//
//  ContentView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/6/22.
//

import SwiftUI


struct Home: View {
    var body: some View {
        
        NavigationView{
            ZStack{
                //Create Background Image
                Image("Home Page")
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -100)
                
                VStack{
                    //Hello Text
                    HelloBar()
                    
                    Spacer()
                        .frame(height:150)
                    
                    //
//                    IamText()
                    
                    Spacer()
                        .frame(height:120)
                    
                    
                    NavigationLink(destination: GeneralSurvey()) {
                        SurveyButton()
                    }
                    Spacer()
                        .frame(height:50)
                    //Start Button
//                    NavigationLink(destination: AdminPageOne(team: teams[0])) {
//                        StartButton()
//                    }
//                    Spacer()
//                        .frame(height:50)
                    
                    NavigationLink(destination: SyncPageOne()) {
                        SyncButton()
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
//                    Button {
//                        reset()
//                    } label: {
//                        Text("Reset")
//                    }


                }
            }
        }
    }
    
    
    func reset(){
        var AutoLowerHub: [Int] = Array(repeating: 0, count: 480)
        var AutoStartPos: [Int] = Array(repeating: 0, count: 480)
        var AutoUpperHub: [Int] = Array(repeating: 0, count: 480)
        var ClimbAttempted: [Bool] = Array(repeating: true, count: 480)
        var ClimbLevel: [Int] = Array(repeating: 0, count: 480)
        var ClimbSuccessful: [Bool] = Array(repeating: true, count: 480)
        var Comments: [String] = Array(repeating: "", count: 480)
        var DefenseAbility: [Int] = Array(repeating: 0, count: 480)
        var DefensePlayedOn: [Int] = Array(repeating: 0, count: 480)
        var DriverLowerHub: [Int] = Array(repeating: 0, count: 480)
        var DriverUpperHub: [Int] = Array(repeating: 0, count: 480)
        var ExitTarmac: [Bool] = Array(repeating:true, count: 480)
        var Fouls: [Int] = Array(repeating: 0, count: 480)
        var MatchNum: [Int] = Array(repeating: 0, count: 480)
        var Present: [Bool] = Array(repeating: true, count: 480)
        var ScoringLocation: [Int] = Array(repeating: 0, count: 480)

        var edited: [Bool] = Array(repeating: false, count: 480)

        var MatchIndex: [Int] = Array(repeating: 0, count: 480)

        var lastEdited:  [Int] = Array(repeating: 0, count: 40)
        
        userDefaults.set(AutoLowerHub, forKey: "AutoLowerHub")
        userDefaults.set(AutoStartPos, forKey: "AutoStartPos")
        userDefaults.set(AutoUpperHub, forKey: "AutoUpperHub")
        userDefaults.set(ClimbAttempted, forKey: "ClimbAttempted")
        userDefaults.set(ClimbLevel, forKey: "ClimbLevel")
        userDefaults.set(ClimbSuccessful, forKey: "ClimbSuccessful")
        userDefaults.set(Comments, forKey: "Comments")
        userDefaults.set(DefenseAbility, forKey: "DefenseAbility")
        userDefaults.set(DefensePlayedOn, forKey: "DefensePlayedOn")
        userDefaults.set(DriverLowerHub, forKey: "DriverLowerHub")
        userDefaults.set(DriverUpperHub, forKey: "DriverUpperHub")
        userDefaults.set(ExitTarmac, forKey: "ExitTarmac")
        userDefaults.set(Fouls, forKey: "Fouls")
        userDefaults.set(MatchNum, forKey: "MatchNum")
        userDefaults.set(Present, forKey: "Present")
        userDefaults.set(ScoringLocation, forKey: "ScoringLocation")
        userDefaults.set(edited, forKey: "edited")
        userDefaults.set(MatchIndex, forKey: "MatchIndex")
        userDefaults.set(lastEdited, forKey: "lastEdited")
    }
    
    
}



struct HelloBar: View {
    var body: some View {
        Text("Hello, 7407!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.01, green: 0.543, blue: 0.66))
            .offset(y: -135)
    }
}

struct IamText: View {
    var body: some View {
        Text("I am...")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.yellow)
    }
}

struct StartButton: View {
    var body: some View {
        Text("Start")
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.green, lineWidth: 5)
                    )
    }
}

struct SurveyButton: View {
    var body: some View {
        Text("Survey")
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                    )
    }
}

struct SyncButton: View {
    var body: some View {
        Text("Sync")
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
                    )
    }
}

struct FieldButton: View {
    var body: some View {
        Text("Field")
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.green, lineWidth: 5)
                    )
                .padding(.bottom, 100)
                .padding(.top, -100)
                .offset(y: 100)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
