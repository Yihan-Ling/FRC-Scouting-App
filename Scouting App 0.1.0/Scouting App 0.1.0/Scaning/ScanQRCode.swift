//
//  SwiftUIView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//


import SwiftUI

//Scanning function imported from
//https://github.com/twostraws/CodeScanner

import CodeScanner

struct ScanQRCode: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    var match: Match
    var body: some View {
        VStack(spacing: 10) {
            if let code = scannedCode {
                NavigationLink("Next page", destination: Handle(scannedCode: code, match: match), isActive: .constant(true)).hidden()
            }
            
            Button("Scan Code") {
                isPresentingScanner = true
            }
            
            Text("Scan a QR code to begin")
        }
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isPresentingScanner = false
                }
            }
        }
    }
    
}

struct ScanQRCode_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRCode(match:matches[0])
    }
}
