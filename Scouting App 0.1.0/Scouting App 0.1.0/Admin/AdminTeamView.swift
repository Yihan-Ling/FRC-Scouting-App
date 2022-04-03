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
        let matchIndex = team.index*6
//        print (matchIndex)
        List{
            MatchRow(match: matches[matchIndex])
            MatchRow(match: matches[matchIndex+1])
            MatchRow(match: matches[matchIndex+2])
            MatchRow(match: matches[matchIndex+3])
            MatchRow(match: matches[matchIndex+4])
            MatchRow(match: matches[matchIndex+5])
        }

    }
}

struct AdminTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTeamView(team:teams[0])
    }
}
