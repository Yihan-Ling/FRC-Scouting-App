//
//  AdminTeamRow.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/9/22.
//

import Foundation
import SwiftUI

struct FieldPageRow: View {
    var team: Team
    var body: some View {
//        NavigationView{
        
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
//                NavigationLink(destination: FieldTeamView(team:teams[team.index])) {
//                    Text(team.name)
//                        .font(.headline)
//                        .multilineTextAlignment(.center)
//                }
                NavigationLink(destination: Survey(team:team)) {
                    Text(team.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                
                
            }
//        }
        
    }
}

struct FieldPageRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FieldPageRow(team: teams[0])
                .previewLayout(.fixed(width: 300, height: 70))
            FieldPageRow(team: teams[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }

    }
}
