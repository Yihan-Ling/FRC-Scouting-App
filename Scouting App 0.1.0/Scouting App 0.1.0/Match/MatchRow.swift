//
//  MatchRow.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/13/22.
//

import SwiftUI

struct MatchRow: View {
    var match: Match
    
    var body: some View {
        HStack {
            VStack{
                let matchIndex = (match.index*6)+match.matchIndex
                //Match Num
                Text("Game "+String(match.matchIndex+1))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
                    .multilineTextAlignment(.center)
                    .frame(width: 150)
                
                //Team id
                Text(match.id)
                    .font(.caption)
                    .frame(width: 150)
            }
            
            Spacer()
                .frame(width: 50)
            
            //Link to MatchView
            NavigationLink(destination: MatchView(match:match)) {
                Text("More Detail")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct MatchRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchRow(match: matches[0])
                .previewLayout(.fixed(width: 300, height: 70))
            MatchRow(match: matches[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
