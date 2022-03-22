//
//  SwiftUIView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/17/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct GenerateQRCode: View {
    var match:Match
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var presents=UserDefaults.standard.object(forKey: "presents") as! [Bool]
    var auBScore=UserDefaults.standard.object(forKey: "auBScore") as! [Int]
    var auLeave=UserDefaults.standard.object(forKey: "auLeave") as! [Bool]
    var cargoScore=UserDefaults.standard.object(forKey: "cargoScore") as! [Int]
    var climbScore=UserDefaults.standard.object(forKey: "climbScore") as! [Int]
    
    var body: some View {
        Image(uiImage: generateQRCode(from: convertToText ()))
            .resizable()
            .interpolation(.none)
            .scaledToFit()
            .frame(width: 200, height: 200)
            
    }
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    func convertToText () -> String{
        let matchIndex = (match.index*3)+match.matchNum
        let data = String(presents[matchIndex])+"\n"+String(auBScore[matchIndex])+"\n"+String(auLeave[matchIndex])+"\n"+String(cargoScore[matchIndex])+"\n"+String(climbScore[matchIndex])+"\n"
        return data
    }

}

struct GenerateQRCode_Previews: PreviewProvider {
    static var previews: some View {
        GenerateQRCode(match:matches[0])
    }
}
