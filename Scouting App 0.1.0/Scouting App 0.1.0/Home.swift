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
                Image("Home Page")
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -20)
                
                VStack{

                    HelloBar()
                    
                    Spacer()
                        .frame(height:150)
                    
                    IamText()
                    
                    Spacer()
                        .frame(height:80)
                    
                    NavigationLink(destination: AdminPageOne(team: teams[0])) {
                        StartButton()
                    }

//                    Spacer()
//                            .frame(height:100)
//
//                    NavigationLink(destination: FieldPageOne(team: teams[0])) {
//                        FieldButton()
//                    }
                    
                    
                }
            }
        }
    }
    
    func initialSave(){
    //    for match in matches{
    //        presents[match.index]=team.present
    //        teams[team.index].barIndex=team.barIndex
    //        teams[team.index].ballScore=team.ballScore
    //        auBScore[team.index]=team.auBScore
    //        auLeave[team.index]=team.auLeave
    //        cargoScore[team.index]=team.cargoScore
    //        climbScore[team.index]=climbOption[team.climbScore]
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
    //    }
        
    }
}



struct HelloBar: View {
    var body: some View {
        Text("Hello, Scout!")
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
