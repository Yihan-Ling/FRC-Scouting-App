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
    var presents=UserDefaults.standard.object(forKey: "presents") as! [Bool]
    var auBScore=UserDefaults.standard.object(forKey: "auBScore") as! [Int]
    var auLeave=UserDefaults.standard.object(forKey: "auLeave") as! [Bool]
    var cargoScore=UserDefaults.standard.object(forKey: "cargoScore") as! [Int]
    var climbScore=UserDefaults.standard.object(forKey: "climbScore") as! [Int]
    
    var body: some View {
        
        VStack(spacing: 50){
            
            //All info of the match
            let matchIndex = (match.index*3)+match.matchNum
            Text(match.id+" Game "+String(match.matchNum+1))
            Text("Present: "+String(presents[matchIndex]))
            Text("Auto Ball Score: "+String(auBScore[matchIndex]))
            Text("Did they leave the zone during auto: "+String(auLeave[matchIndex]))
            Text("How many points did they score from cargo: "+String(cargoScore[matchIndex]))
            Text("Their Climb Score: "+String(climbScore[matchIndex]))
            
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
            NavigationLink(destination: QRManage(match:match)) {
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
