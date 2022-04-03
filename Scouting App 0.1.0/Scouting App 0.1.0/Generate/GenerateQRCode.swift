//
//  GenerateQRCode.swift
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
    
    var AutoLowerHub=UserDefaults.standard.object(forKey: "AutoLowerHub") as! [Int]
    var AutoStartPos=UserDefaults.standard.object(forKey: "AutoStartPos") as! [Int]
    var AutoUpperHub=UserDefaults.standard.object(forKey: "AutoUpperHub") as! [Int]
    var ClimbAttempted=UserDefaults.standard.object(forKey: "ClimbAttempted") as! [Bool]
    var ClimbLevel=UserDefaults.standard.object(forKey: "ClimbLevel") as! [Int]
    var ClimbSuccessful=UserDefaults.standard.object(forKey: "ClimbSuccessful") as! [Bool]
    var Comments=UserDefaults.standard.object(forKey: "Comments") as! [String]
    var DefenseAbility=UserDefaults.standard.object(forKey: "DefenseAbility") as! [Int]
    var DefensePlayedOn=UserDefaults.standard.object(forKey: "DefensePlayedOn") as! [Int]
    var DriverLowerHub=UserDefaults.standard.object(forKey: "DriverLowerHub") as! [Int]
    var DriverUpperHub=UserDefaults.standard.object(forKey: "DriverUpperHub") as! [Int]
    var ExitTarmac=UserDefaults.standard.object(forKey: "ExitTarmac") as! [Bool]
    var Fouls=UserDefaults.standard.object(forKey: "Fouls") as! [Int]
    var MatchNum=UserDefaults.standard.object(forKey: "MatchNum") as! [Int]
    var Present=UserDefaults.standard.object(forKey: "Present") as! [Bool]
    var ScoringLocation=UserDefaults.standard.object(forKey: "ScoringLocation") as! [Int]
    
    var body: some View {
        //Create QR Code Image UI
        Image(uiImage: generateQRCode(from: convertToText ()))
            .resizable()
            .interpolation(.none)
            .scaledToFit()
            .frame(width: 200, height: 200)
            
    }
    func generateQRCode(from string: String) -> UIImage {
        //Get data
        filter.message = Data(string.utf8)
        
        //Create QR Code from data
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    func convertToText () -> String{
        //Covert Match Info to Text
        let matchIndex = (match.index*6)+match.matchIndex
        let data = String(AutoLowerHub[matchIndex])+"\n"+String(AutoStartPos[matchIndex])+"\n"+String(AutoUpperHub[matchIndex])+"\n"+String(ClimbAttempted[matchIndex])+"\n"+String(ClimbLevel[matchIndex])+"\n"+String(ClimbSuccessful[matchIndex])+"\n"+String(Comments[matchIndex])+"\n"+String(DefenseAbility[matchIndex])+"\n"+String(DefensePlayedOn[matchIndex])+"\n"+String(DriverLowerHub[matchIndex])+"\n"+String(DriverUpperHub[matchIndex])+"\n"+String(ExitTarmac[matchIndex])+"\n"+String(Fouls[matchIndex])+"\n"+String(MatchNum[matchIndex])+"\n"+String(Present[matchIndex])+"\n"+String(ScoringLocation[matchIndex])+"\n"
        return data
    }

}

struct GenerateQRCode_Previews: PreviewProvider {
    static var previews: some View {
        GenerateQRCode(match:matches[0])
    }
}
