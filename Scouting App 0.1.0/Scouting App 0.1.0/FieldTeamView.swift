//
//  FieldPageView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/10/22.
//

import SwiftUI

struct FieldTeamView: View {
    var team: Team
    var body: some View {
        Text(team.id+" Field")
    }
}

struct FieldPageView_Previews: PreviewProvider {
    static var previews: some View {
        FieldTeamView(team:teams[0])
    }
}
