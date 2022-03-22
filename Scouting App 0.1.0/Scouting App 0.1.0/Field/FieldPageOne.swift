//
//  FieldPageOne.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/8/22.
//

import Foundation
import SwiftUI

struct FieldPageOne: View {
    var team: Team

    var body: some View {
        List (teams){ team in
            FieldPageRow(team: team)
        }
    }
}

struct FieldPageOne_Previews: PreviewProvider {
    static var previews: some View {
        FieldPageOne(team: teams[0])
    }
}
