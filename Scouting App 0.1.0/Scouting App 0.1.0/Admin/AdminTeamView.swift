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
            Group{
                MatchRow(match: matches[matchIndex])
                MatchRow(match: matches[matchIndex+1])
                MatchRow(match: matches[matchIndex+2])
                MatchRow(match: matches[matchIndex+3])
                MatchRow(match: matches[matchIndex+4])
                MatchRow(match: matches[matchIndex+5])
                
            }
            Group{
                MatchRow(match: matches[matchIndex+6])
                MatchRow(match: matches[matchIndex+7])
                MatchRow(match: matches[matchIndex+8])
                MatchRow(match: matches[matchIndex+9])
                MatchRow(match: matches[matchIndex+10])
                MatchRow(match: matches[matchIndex+11])
            }
            
            
        }

    }
}

struct AdminTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTeamView(team:teams[0])
    }
}
