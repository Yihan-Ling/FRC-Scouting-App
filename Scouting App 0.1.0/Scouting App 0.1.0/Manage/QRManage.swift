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
            // Link to Generate QR Code
            NavigationLink(destination: GenerateQRCode(match:match)) {
                button(text: "Generate")
            }

            //Link to Scan QR Code
            NavigationLink(destination: ScanQRCode(match:match)) {
                button(text: "Scan")
            }
        }
    }
}

// Button Structure
struct button: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.green)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.green, lineWidth: 5)
                    )
    }
}

struct QRManage_Previews: PreviewProvider {
    static var previews: some View {
        QRManage(match: matches[0])
    }
}

 
