//
//  AdminPageOne.swift
//  Scouting App 0.1.0
//
//  Created by Carson Ling on 2/9/22.
//

import Foundation
import SwiftUI

struct AdminPageOne: View {
    var team: Team

    var body: some View {
        List (teams){ team in
            AdminPageRow(team: team)
        }
    }
}

struct AdminPageOne_Previews: PreviewProvider {
    static var previews: some View {
        AdminPageOne(team: teams[0])
    }
}
