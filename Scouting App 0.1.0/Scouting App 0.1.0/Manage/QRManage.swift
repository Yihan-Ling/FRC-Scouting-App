//
//  QRManage.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//

import SwiftUI

struct QRManage: View {
    var match: Match
    var body: some View {
        VStack(spacing:100){

            NavigationLink(destination: GenerateQRCode(match:match)) {
                Text("Generate")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }

            
            NavigationLink(destination: ScanQRCode(match:match)) {
                Text("Scan")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }
        }
    }
}

struct QRManage_Previews: PreviewProvider {
    static var previews: some View {
        QRManage(match: matches[0])
    }
}

 
