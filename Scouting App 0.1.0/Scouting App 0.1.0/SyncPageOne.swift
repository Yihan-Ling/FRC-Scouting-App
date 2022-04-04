//
//  SyncPageOne.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 3/30/22.
//

import SwiftUI
import Firebase

struct SyncPageOne: View {
    var body: some View {
        VStack{
            Button {
                readFromdb()
            } label: {
                Text("Update Data")
            }
            Button {
                writeTodb()
            } label: {
                Text("Upload data to database")
            }
            Button {
                export()
            } label: {
                Text("Export File")
            }

        }
        
        
    }
    
    
    
    func export(){
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
        
        var data = "[\n"
        
        for i in 0...39{
            for j in 0...11{
                data+="{\n"
                data+="\"id\": "+"\""+teams[i].id+"\""+",\n"
                data+="\"index\": "+String(i)+",\n"
                data+="\"matchIndex\": "+String(j)+",\n"
                data+="\"AutoLowerHub\": "+String(AutoLowerHub[i*12+j])+",\n"
                data+="\"AutoStartPos\": "+String(AutoStartPos[i*12+j])+",\n"
                data+="\"AutoUpperHub\": "+String(AutoUpperHub[i*12+j])+",\n"
                data+="\"ClimbAttempted\": "+String(ClimbAttempted[i*12+j])+",\n"
                data+="\"ClimbLevel\": "+String(ClimbLevel[i*12+j])+",\n"
                data+="\"ClimbSuccessful\": "+String(ClimbSuccessful[i*12+j])+",\n"
                data+="\"Comments\": "+"\""+String(Comments[i*12+j])+"\""+",\n"
                data+="\"DefenseAbility\": "+String(DefenseAbility[i*12+j])+",\n"
                data+="\"DefensePlayedOn\": "+String(DefensePlayedOn[i*12+j])+",\n"
                data+="\"DriverLowerHub\": "+String(DriverLowerHub[i*12+j])+",\n"
                data+="\"DriverUpperHub\": "+String(DriverUpperHub[i*12+j])+",\n"
                data+="\"ExitTarmac\": "+String(ExitTarmac[i*12+j])+",\n"
                data+="\"Fouls\": "+String(Fouls[i*12+j])+",\n"
                data+="\"MatchNum\": "+String(MatchNum[i*12+j])+",\n"
                data+="\"Present\": "+String(Present[i*12+j])+",\n"
                data+="\"ScoringLocation\": "+String(ScoringLocation[i*12+j])+",\n"
                if i*12+j == 479{
                    data+="}\n"
                }
                else{
                    data+="},\n"
                }
            }
            
        }
        data+="]"
        UIPasteboard.general.string = data
    }
    
    
    
    
    
    
    
    
    func readFromdb(){
        var a: [Int]=[0]
        var b: [Int]=[0]
        var c: [Int]=[0]
        var d: [Bool]=[true]
        var e: [Int]=[0]
        var f: [Bool]=[true]
        var g: [String]=[""]
        var h: [Int]=[0]
        var i: [Int]=[0]
        var j: [Int]=[0]
        var k: [Int]=[0]
        var l: [Bool]=[true]
        var m: [Int]=[0]
        var n: [Int]=[0]
        var o: [Bool]=[true]
        var p: [Int]=[0]
        
        
        let db = Firestore.firestore()
        let docRef = db.collection("Hartford").document("Matches")
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    a = data["AutoLowerHub"] as? [Int] ?? [-1]
                    b = data["AutoStartPos"] as? [Int] ?? [-1]
                    c = data["AutoUpperHub"] as? [Int] ?? [0]
                    d = data["ClimbAttempted"] as? [Bool] ?? [true]
                    e = data["ClimbLevel"] as? [Int] ?? [0]
                    f = data["ClimbSuccessful"] as? [Bool] ?? [true]
                    g = data["Comments"] as? [String] ?? [""]
                    h = data["DefenseAbility"] as? [Int] ?? [0]
                    i = data["DefensePlayedOn"] as? [Int] ?? [0]
                    j = data["DriverLowerHub"] as? [Int] ?? [0]
                    k = data["DriverUpperHub"] as? [Int] ?? [0]
                    l = data["ExitTarmac"] as? [Bool] ?? [true]
                    m = data["Fouls"] as? [Int] ?? [0]
                    n = data["MatchNum"] as? [Int] ?? [0]
                    o = data["Present"] as? [Bool] ?? [true]
                    p = data["ScoringLocation"] as? [Int] ?? [0]
                    print(d[0])
                }
            }
            
            var autoLowerHub=UserDefaults.standard.object(forKey: "AutoLowerHub") as! [Int]
            var autoStartPos=UserDefaults.standard.object(forKey: "AutoStartPos") as! [Int]
            var autoUpperHub=UserDefaults.standard.object(forKey: "AutoUpperHub") as! [Int]
            var climbAttempted=UserDefaults.standard.object(forKey: "ClimbAttempted") as! [Bool]
            var climbLevel=UserDefaults.standard.object(forKey: "ClimbLevel") as! [Int]
            var climbSuccessful=UserDefaults.standard.object(forKey: "ClimbSuccessful") as! [Bool]
            var comments=UserDefaults.standard.object(forKey: "Comments") as! [String]
            var defenseAbility=UserDefaults.standard.object(forKey: "DefenseAbility") as! [Int]
            var defensePlayedOn=UserDefaults.standard.object(forKey: "DefensePlayedOn") as! [Int]
            var driverLowerHub=UserDefaults.standard.object(forKey: "DriverLowerHub") as! [Int]
            var driverUpperHub=UserDefaults.standard.object(forKey: "DriverUpperHub") as! [Int]
            var exitTarmac=UserDefaults.standard.object(forKey: "ExitTarmac") as! [Bool]
            var fouls=UserDefaults.standard.object(forKey: "Fouls") as! [Int]
            var matchNum=UserDefaults.standard.object(forKey: "MatchNum") as! [Int]
            var PResent=UserDefaults.standard.object(forKey: "Present") as! [Bool]
            var scoringLocation=UserDefaults.standard.object(forKey: "ScoringLocation") as! [Int]
            var edited=UserDefaults.standard.object(forKey: "edited") as! [Bool]
            
            
            for x in 0...479{
                if(edited[x]==false){
                    autoLowerHub[x]=a[x]
                    autoStartPos[x]=b[x]
                    autoUpperHub[x]=c[x]
                    climbAttempted[x]=d[x]
                    climbLevel[x]=e[x]
                    climbSuccessful[x]=f[x]
                    comments[x]=g[x]
                    defenseAbility[x]=h[x]
                    defensePlayedOn[x]=i[x]
                    driverLowerHub[x]=j[x]
                    driverUpperHub[x]=k[x]
                    exitTarmac[x]=l[x]
                    fouls[x]=m[x]
                    matchNum[x]=n[x]
                    PResent[x]=o[x]
                    scoringLocation[x]=p[x]
                }
            }
            
            
            
            
//            for x in 0...239 {
//
//
//
//                if(AutoLowerHub[x]==0&&a[x]==0){
//                    continue
//                }
//                else if !(AutoLowerHub[x]==0){
//                    continue
//                }
//                else{
//                    AutoLowerHub[x]=a[x]
//                }
//
//
//
//                if(AutoStartPos[x]==0&&b[x]==0){
//                    continue
//                }
//                else if !(AutoStartPos[x]==0){
//                    continue
//                }
//                else{
//                    AutoStartPos[x]=b[x]
//                }
//
//
//                if(AutoUpperHub[x]==0&&c[x]==0){
//                    continue
//                }
//                else if !(AutoUpperHub[x]==0){
//                    continue
//                }
//                else{
//                    AutoUpperHub[x]=c[x]
//                }
//
//
//                if(d[x]==false){
//                    ClimbAttempted[x]=d[x]
//                }
//
//
//                if(ClimbLevel[x]==0&&e[x]==0){
//                    continue
//                }
//                else if !(ClimbLevel[x]==0){
//                    continue
//                }
//                else{
//                    ClimbLevel[x]=e[x]
//                }
//
//
//
//                if(ClimbSuccessful[x]&&f[x]){
//                    continue
//                }
//                else if !(ClimbSuccessful[x]){
//                    continue
//                }
//                else{
//                    ClimbSuccessful[x]=f[x]
//                }
//
//                if(Comments[x]==""&&g[x]==""){
//                    continue
//                }
//                else if !(Comments[x]==""){
//                    continue
//                }
//                else{
//                    Comments[x]=g[x]
//                }
//
//                if(DefenseAbility[x]==0&&h[x]==0){
//                    continue
//                }
//                else if !(DefenseAbility[x]==0){
//                    continue
//                }
//                else{
//                    DefenseAbility[x]=h[x]
//                }
//
//                if(DefensePlayedOn[x]==0&&i[x]==0){
//                    continue
//                }
//                else if !(DefensePlayedOn[x]==0){
//                    continue
//                }
//                else{
//                    DefensePlayedOn[x]=i[x]
//                }
//
//                if(DriverLowerHub[x]==0&&j[x]==0){
//                    continue
//                }
//                else if !(DriverLowerHub[x]==0){
//                    continue
//                }
//                else{
//                    DriverLowerHub[x]=j[x]
//                }
//
//                if(DriverUpperHub[x]==0&&k[x]==0){
//                    continue
//                }
//                else if !(DriverUpperHub[x]==0){
//                    continue
//                }
//                else{
//                    DriverUpperHub[x]=k[x]
//                }
//
//                if(ExitTarmac[x]&&l[x]){
//                    continue
//                }
//                else if !(ExitTarmac[x]){
//                    continue
//                }
//                else{
//                    ExitTarmac[x]=l[x]
//                }
//
//                if(Fouls[x]==0&&m[x]==0){
//                    continue
//                }
//                else if !(Fouls[x]==0){
//                    continue
//                }
//                else{
//                    Fouls[x]=m[x]
//                }
//
//                if(MatchNum[x]==0&&n[x]==0){
//                    continue
//                }
//                else if !(MatchNum[x]==0){
//                    continue
//                }
//                else{
//                    MatchNum[x]=n[x]
//                }
//
//                if(Present[x]&&o[x]){
//                    continue
//                }
//                else if !(Present[x]){
//                    continue
//                }
//                else{
//                    Present[x]=o[x]
//                }
//
//                if(ScoringLocation[x]==0&&p[x]==0){
//                    continue
//                }
//                else if !(ScoringLocation[x]==0){
//                    continue
//                }
//                else{
//                    ScoringLocation[x]=p[x]
//                }
//
//
//            }
//
            let userDefaults = UserDefaults.standard
            userDefaults.set(autoLowerHub, forKey: "AutoLowerHub")
//            AutoLowerHub=userDefaults.object(forKey: "AutoLowerHub") as! [Int]
            
            userDefaults.set(autoStartPos, forKey: "AutoStartPos")
//            AutoStartPos=userDefaults.object(forKey: "AutoStartPos") as! [Int]
            
            userDefaults.set(autoUpperHub, forKey: "AutoUpperHub")
//            AutoUpperHub=userDefaults.object(forKey: "AutoUpperHub") as! [Int]
            
            userDefaults.set(climbAttempted, forKey: "ClimbAttempted")
//            ClimbAttempted=userDefaults.object(forKey: "ClimbAttempted") as! [Bool]
            
            userDefaults.set(climbLevel, forKey: "ClimbLevel")
//            ClimbLevel=userDefaults.object(forKey: "ClimbLevel") as! [Int]
            
            userDefaults.set(climbSuccessful, forKey: "ClimbSuccessful")
//            ClimbSuccessful=userDefaults.object(forKey: "ClimbSuccessful") as! [Bool]
            
            userDefaults.set(comments, forKey: "Comments")
//            Comments=userDefaults.object(forKey: "Comments") as! [String]
            
            userDefaults.set(defenseAbility, forKey: "DefenseAbility")
//            DefenseAbility=userDefaults.object(forKey: "DefenseAbility") as! [Int]
            
            userDefaults.set(defensePlayedOn, forKey: "DefensePlayedOn")
//            DefensePlayedOn=userDefaults.object(forKey: "DefensePlayedOn") as! [Int]
            
            userDefaults.set(driverLowerHub, forKey: "DriverLowerHub")
//            DriverLowerHub=userDefaults.object(forKey: "DriverLowerHub") as! [Int]
            
            userDefaults.set(driverUpperHub, forKey: "DriverUpperHub")
//            DriverUpperHub=userDefaults.object(forKey: "DriverUpperHub") as! [Int]
            
            userDefaults.set(exitTarmac, forKey: "ExitTarmac")
//            ExitTarmac=userDefaults.object(forKey: "ExitTarmac") as! [Bool]
            
            userDefaults.set(fouls, forKey: "Fouls")
//            Fouls=userDefaults.object(forKey: "Fouls") as! [Int]
            
            userDefaults.set(matchNum, forKey: "MatchNum")
//            MatchNum=userDefaults.object(forKey: "MatchNum") as! [Int]
            
            userDefaults.set(PResent, forKey: "Present")
//            Present=userDefaults.object(forKey: "Present") as! [Bool]
            
            userDefaults.set(scoringLocation, forKey: "ScoringLocation")
//            ScoringLocation=userDefaults.object(forKey: "ScoringLocation") as! [Int]
            
        }
        

    }
    
    
    func writeTodb(){
        let db = Firestore.firestore()
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
        
        db.collection("Hartford").document("Matches").setData(["AutoLowerHub": AutoLowerHub], merge: true)
        db.collection("Hartford").document("Matches").setData(["AutoStartPos": AutoStartPos], merge: true)
        db.collection("Hartford").document("Matches").setData(["AutoUpperHub": AutoUpperHub], merge: true)
        db.collection("Hartford").document("Matches").setData(["ClimbAttempted": ClimbAttempted], merge: true)
        db.collection("Hartford").document("Matches").setData(["ClimbLevel": ClimbLevel], merge: true)
        db.collection("Hartford").document("Matches").setData(["ClimbSuccessful": ClimbSuccessful], merge: true)
        db.collection("Hartford").document("Matches").setData(["Comments": Comments], merge: true)
        db.collection("Hartford").document("Matches").setData(["DefenseAbility": DefenseAbility], merge: true)
        db.collection("Hartford").document("Matches").setData(["DefensePlayedOn": DefensePlayedOn], merge: true)
        db.collection("Hartford").document("Matches").setData(["DriverLowerHub": DriverLowerHub], merge: true)
        db.collection("Hartford").document("Matches").setData(["DriverUpperHub": DriverUpperHub], merge: true)
        db.collection("Hartford").document("Matches").setData(["ExitTarmac": ExitTarmac], merge: true)
        db.collection("Hartford").document("Matches").setData(["Fouls": Fouls], merge: true)
        db.collection("Hartford").document("Matches").setData(["MatchNum": MatchNum], merge: true)
        db.collection("Hartford").document("Matches").setData(["Present": Present], merge: true)
        db.collection("Hartford").document("Matches").setData(["ScoringLocation": ScoringLocation], merge: true)
        
        
    }
}

struct SyncPageOne_Previews: PreviewProvider {
    static var previews: some View {
        SyncPageOne()
    }
}
