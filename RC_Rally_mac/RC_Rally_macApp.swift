//
//  RC_Rally_macApp.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer  on 18.04.22.
//

import SwiftUI

@main
struct RC_Rally_macApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            FahrerListe().environmentObject(FahrerModel())
        }
    }
}
