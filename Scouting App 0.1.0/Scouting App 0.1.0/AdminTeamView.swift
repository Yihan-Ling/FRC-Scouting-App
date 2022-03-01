//
//  AdminTeamView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/10/22.
//

import SwiftUI

struct AdminTeamView: View {
    var team: Team
    let arr=UserDefaults.standard.object(forKey: "presents") as! [Bool]
    var body: some View {
        VStack{
            Text(team.id+" Admin")
            Text(String(arr[team.index]))
        }
        
    }
}

struct AdminTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTeamView(team:teams[0])
    }
}
