//
//  ContentView.swift
//  keychain-access-group-team-id
//
//  Created by Samiran Saha on 15/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let bundleSeedId:String = keychain_access_group_team_idApp.bundleSeedID()!
        
        Text("Hello, world!")
            .padding()

        Text("Bundle Seed ID: " + bundleSeedId)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

