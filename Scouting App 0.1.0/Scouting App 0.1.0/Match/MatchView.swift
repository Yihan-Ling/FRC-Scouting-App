//
//  MatchView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/13/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CoreImage

struct MatchView: View {
    var match: Match
    
    //Updat in-app arrays
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
    
    
    var body: some View {
        
        VStack(){
            
//            //All info of the match
            let matchIndex: Int = Int((match.index*12)+match.matchIndex)
            Group{
                Text(match.id+" Game "+String(match.matchIndex+1))
                Text("AutoLowerHub: "+String(AutoLowerHub[matchIndex]))
                Text("AutoStartPos: "+String(AutoStartPos[matchIndex]))
                Text("AutoUpperHub: "+String(AutoUpperHub[matchIndex]))
                Text("ClimbAttempted: "+String(ClimbAttempted[matchIndex]))
                Text("ClimbLevel: "+String(ClimbLevel[matchIndex]))
                Text("ClimbSuccessful: "+String(ClimbSuccessful[matchIndex]))
                Text("Comments: "+Comments[matchIndex])
                Text("DefenseAbility: "+String(DefenseAbility[matchIndex]))
                Text("DefensePlayedOn: "+String(DefensePlayedOn[matchIndex]))
            }
            Group{
                Text("DriverLowerHub: "+String(DriverLowerHub[matchIndex]))
                Text("DriverUpperHub: "+String(DriverUpperHub[matchIndex]))
                Text("ExitTarmac: "+String(ExitTarmac[matchIndex]))
                Text("Fouls: "+String(Fouls[matchIndex]))
                Text("MatchNum: "+String(MatchNum[matchIndex]))
                Text("Present: "+String(Present[matchIndex]))
                Text("ScoringLocation: "+String(ScoringLocation[matchIndex]))
            }
            
            
            
            //Link to Survey to edit the info
            NavigationLink(destination: Survey(team:teams[match.index], match: match)) {
                Text("Survey")
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

            //Link to QR Code Generate or scanning
            NavigationLink(destination: QRManage(match: match)) {
                Text("Share")
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
        
    }
}


struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(match:matches[0])
    }
}
