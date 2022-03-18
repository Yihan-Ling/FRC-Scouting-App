//
//  AdminTeamView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/10/22.
//

import SwiftUI

struct AdminTeamView: View {
//    var team: Team
//    let pResents=UserDefaults.standard.object(forKey: "presents") as! [Bool]
//    let aUBScore=UserDefaults.standard.object(forKey: "auBScore") as! [Int]
//    let aULeave=UserDefaults.standard.object(forKey: "auLeave") as! [Bool]
    var team: Team
    var body: some View {
//        VStack{
//            Text(team.id+" Admin")
//            Text(String(pResents[team.index]))
//            Text(String(aUBScore[team.index]))
//            Text(String(auLeave[team.index]))
//            Text(String(cargoScore[team.index]))
//            Text(String(climbScore[team.index]))
//        }
        GameRow(team:team)
    }
}

struct AdminTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTeamView(team:teams[0])
    }
}
