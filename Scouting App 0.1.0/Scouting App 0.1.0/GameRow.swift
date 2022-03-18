//
//  GameRow.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/13/22.
//

import SwiftUI

struct GameRow: View {
    var team: Team
    var body: some View {
//        NavigationView{
        
            HStack {
                VStack{
                    Text("Game One")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .multilineTextAlignment(.center)
                        .frame(width: 150)
                    Text(team.id)
                        .font(.caption)
                        .frame(width: 150)
                }
                
                Spacer()
                    .frame(width: 50)
                
                NavigationLink(destination: QRManage()) {
                    Text(team.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                
                
            }
//        }
        
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdminPageRow(team: teams[0])
                .previewLayout(.fixed(width: 300, height: 70))
            AdminPageRow(team: teams[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
