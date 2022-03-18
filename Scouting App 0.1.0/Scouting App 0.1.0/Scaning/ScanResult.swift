//
//  NextView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//

import SwiftUI

struct ScanResult: View {
    var scannedCode: String
    var body: some View {
        Text(scannedCode)
    }
}

struct ScanResult_Previews: PreviewProvider {
    static var previews: some View {
        ScanResult(scannedCode:"hello")
    }
}
