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
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    let pResents=UserDefaults.standard.object(forKey: "presents") as! [Bool]
    let aUBScore=UserDefaults.standard.object(forKey: "auBScore") as! [Int]
    
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
        let data = String(pResents[0])+"\n"+String(aUBScore[0])+"\n"
        return data
    }

}

struct GenerateQRCode_Previews: PreviewProvider {
    static var previews: some View {
        GenerateQRCode()
    }
}
