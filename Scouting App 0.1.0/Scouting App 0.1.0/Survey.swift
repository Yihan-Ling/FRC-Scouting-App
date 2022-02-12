//
//  Form.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/11/22.
//

import SwiftUI

struct Survey: View {
    @State var teamid: String
    @State var present: Bool = true
    @State private var barIndex = 0
    
    var barOptions = ["0", "5", "10", "15", "50"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $teamid)
                Toggle(isOn: $present) {
                    Text("Present")
                }
                Section(header: Text("EVALUATION")) {
//                    Toggle(isOn: $notificationsEnabled) {
//                        Text("Enabled")
//                    }
                    Picker(selection: $barIndex, label: Text("Bar Score")) {
                        ForEach(0 ..< barOptions.count) {
                            Text(self.barOptions[$0])
                        }
                    }
                }
                Section(header: Text("INFO")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("#2")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Perform an action here...")
                    }) {
                        Text("Reset All Selections")
                    }
                }
            }
            .navigationBarTitle("Survey")
        }

    }
}

struct Survey_Previews: PreviewProvider {
    static var previews: some View {
        Survey(teamid:"7407")
    }
}
