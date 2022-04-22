//
//  WertepruefungStamm.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer on 21.04.22.
//

import SwiftUI

struct PruefungDatenEingabe: View {
    
    @State var wertePruefung: WertePruefung
    
    var body: some View {
        
        VStack(alignment: .center) {
            Form {
                HStack(alignment: .center) {
                    Label("WP Nummer :",systemImage: "bolt.fill").labelStyle(.titleOnly)
                    TextField(text: $wertePruefung.wpNummer, prompt: Text("")) {
                        Text("WP Nummer:")
                    }
                }
                HStack(alignment: .center) {
                    Label("Name :",systemImage: "bolt.fill").labelStyle(.titleOnly)
                    
                    TextField(text: $wertePruefung.wpName, prompt: Text("WP Name")) {
                        Text("WP Name:")
                    }
                }

            }.frame(width: 400.0, height: 300.0).textFieldStyle(.roundedBorder).accentColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.72, green: 0.837, blue: 0.978)/*@END_MENU_TOKEN@*/)
        .blendMode(/*@START_MENU_TOKEN@*/.multiply/*@END_MENU_TOKEN@*/)
    }
}

//struct WertepruefungStamm_Previews: PreviewProvider {
//    static var previews: some View {
//        WertepruefungStamm()
//    }
//}
