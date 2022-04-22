//
//  ContentView.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 14.02.22.
//
// Es soll Fahrernummer, Nachname und Vorname
// eingegeben werden können.
// Dann sollen diese Daten in JSON gespeichert werden

import SwiftUI

struct ContentView: View {
    var body: some View {

//        FahrerListe().environmentObject(FahrerModel())
        WPListe().environmentObject(WertePruefungModel())
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
