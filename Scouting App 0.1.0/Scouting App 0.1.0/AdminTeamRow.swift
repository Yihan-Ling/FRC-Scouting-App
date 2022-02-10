//
//  AdminTeamRow.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/9/22.
//

import Foundation
import SwiftUI

struct AdminTeamRow: View {
    var team: Team

    var body: some View {
        HStack {
            VStack{
                Text(team.id)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                    .multilineTextAlignment(.center)
                    .frame(width: 150)
                Text(team.school)
                    .font(.caption)
                    .frame(width: 150)
            }
            
            Spacer()
                .frame(width: 50)
            Text(team.name)
                .font(.headline)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct AdminTeamRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdminTeamRow(team: teams[0])
                .previewLayout(.fixed(width: 300, height: 70))
            AdminTeamRow(team: teams[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }

    }
}
