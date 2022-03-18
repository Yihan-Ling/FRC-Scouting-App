//
//  SwiftUIView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//

import SwiftUI
import CodeScanner

struct ScanQRCode: View {
//    @State private var isShowingScanner = false
//    @State var scannedCode: String = "Empty"
//
//
//    var scannerSheet: some View{
//        CodeScannerView(codeTypes: [.qr]) { result in
//            if case let .success(code) = result{
//                self.scannedCode = code.string
//                self.isShowingScanner = false
//            }
//        }
//    }
//
//    var body: some View {
//        VStack{
//            Text(scannedCode)
//            Button {
//                self.isShowingScanner = true
//            } label: {
//                Text("Click to scan")
//            }
//
//            .sheet(isPresented: $isShowingScanner) {
//                self.scannerSheet
//            }
//        }
//
//
//    }
    @State private var isPresentingScanner = false
        @State private var scannedCode: String?

        var body: some View {
            VStack(spacing: 10) {
                if let code = scannedCode {
                    NavigationLink("Next page", destination: ScanResult(scannedCode: code), isActive: .constant(true)).hidden()
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
        ScanQRCode()
    }
}
