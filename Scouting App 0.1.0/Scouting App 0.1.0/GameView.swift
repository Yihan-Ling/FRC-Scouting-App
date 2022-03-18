//
//  GameView.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/13/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CoreImage

struct GameView: View {
    var team: Team
    let pResents=UserDefaults.standard.object(forKey: "presents") as! [Bool]
    let aUBScore=UserDefaults.standard.object(forKey: "auBScore") as! [Int]
//    let aULeave=UserDefaults.standard.object(forKey: "auLeave") as! [Bool]
    var body: some View {
        VStack{
            Text(team.id+" Admin")
            Text(String(pResents[team.index]))
            Text(String(aUBScore[team.index]))
            Text(String(auLeave[team.index]))
            Text(String(cargoScore[team.index]))
            Text(String(climbScore[team.index]))
//            Button(action: creteScancode) {
//                Text("Share")
//                    .fontWeight(.bold)
//                    .font(.title)
//                    .padding()
//                    .background(Color.purple)
//                    .cornerRadius(40)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 40)
//                            .stroke(Color.purple, lineWidth: 5)
//                    )
//            }
        }
        
    }
    
    
    
//    func creteScancode(){
//
//        let filter = CIFilter.init(name: "CIQRCodeGenerator")
//        filter?.setDefaults()
//        /// Add Data
//        //链接转换
//        let data = "test".data(using: .utf8)
//        filter?.setValue(data, forKeyPath: "inputMessage")
//        /// Out Put
//        let outputImage = filter?.outputImage
//        /// Show QRCode
//        shareUI.logoImage.image = createUIImageFromCIImage(image: outputImage!, size: 50)
//
//    }
//
//    static func createUIImageFromCIImage(image: CIImage, size: CGFloat) -> UIImage {
//            let extent = image.extent.integral
//            let scale = min(size / extent.width, size / extent.height)
//
//            /// Create bitmap
//            let width: size_t = size_t(extent.width * scale)
//            let height: size_t = size_t(extent.height * scale)
//            let cs: CGColorSpace = CGColorSpaceCreateDeviceGray()
//            let bitmap: CGContext = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 1)!
//
//            ///
//            let context = CIContext.init()
//            let bitmapImage = context.createCGImage(image, from: extent)
//            bitmap.interpolationQuality = .none
//            bitmap.scaleBy(x: scale, y: scale)
//            bitmap.draw(bitmapImage!, in: extent)
//
//            let scaledImage = bitmap.makeImage()
//            return UIImage.init(cgImage: scaledImage!)
//        }
//
//
}
//
//
//
//struct shareUI: View {
//    var body: some View {
//        Image(logoImage)
//    }
//}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(team:teams[0])
    }
}
