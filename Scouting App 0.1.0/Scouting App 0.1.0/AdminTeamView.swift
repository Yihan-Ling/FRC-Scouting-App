//
//  AdminTeamView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/10/22.
//

import SwiftUI

struct AdminTeamView: View {
    var team: Team
    var body: some View {
        Text(team.id+" Admin")
    }
}

struct AdminTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTeamView(team:teams[0])
    }
}