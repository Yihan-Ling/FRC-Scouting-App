//
//  SaveResult.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/18/22.
//

import SwiftUI

struct SaveResult: View {
    var team:Team
   
    var body: some View {
        let defaults = UserDefaults.standard
//        defaults.set(team, String(team.index))
        VStack{
            Text("writeToJSON()")
                .padding(10)
                .background(Color.purple)
//            save()
        }
        Text("Hello")
    }
    
    //
    ////
    //    func writeToJSON ()->String{
    //        let str = convertToText()
    //        let url = getDocumentDirectory().appendingPathComponent("teamsData.txt")
    //        let input = "No change"
    //        do{
    //            try str.write(to: url, atomically: true, encoding: .utf8)
    //            let input = try String(contentsOf: url)
    //            return(input)
    //        }
    //        catch{
    //            print(error.localizedDescription)
    //        }
    //        return(input)
    //    }
//    func writeToJSON (data:String)->String{
//        let url = getDocumentDirectory().appendingPathComponent("teamsData.JSON")
//        do{
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            let JsonData = try encoder.encode(data)
//            try JsonData.write(to: url)
//            print (JsonData)
//        }catch{}
//        let input = "No change"
//        do{
//            let input = try String(contentsOf: url)
//            return(input)
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//        return(input)
//    }

}

struct SaveResult_Previews: PreviewProvider {
    static var previews: some View {
        SaveResult(team: teams[0])
    }
}
