//
//  FahrerDatenEingabe.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 14.02.22.
//

import SwiftUI

struct FahrerDatenEingabe: View {
    
    @State var fahrer: Fahrer
    
    var body: some View {
        
        VStack(alignment: .center) {
            Form {
                HStack(alignment: .center) {
  //                  Label("Fahrer Nummer :",systemImage: "bolt.fill").labelStyle(.titleOnly)
                    TextField(text: $fahrer.fahrerNummer, prompt: Text("")) {
                        Text("Fahrer Nummer:")
                    }
                }
                HStack(alignment: .center) {
//                    Label("Nachname :",systemImage: "bolt.fill").labelStyle(.titleOnly)
                    TextField(text: $fahrer.nachName, prompt: Text("Nachname")) {
                        Text("Nachname:")
                    }
                }
                HStack(alignment: .center) {
//                    Label("Vorname :",systemImage: "bolt.fill").labelStyle(.titleOnly)
                    TextField(text: $fahrer.vorName, prompt: Text("Vorname")) {
                        Text("Vorname:")
                    }
                }
            }.frame(width: 400.0, height: 300.0).textFieldStyle(.roundedBorder).accentColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.72, green: 0.837, blue: 0.978)/*@END_MENU_TOKEN@*/)
        .blendMode(/*@START_MENU_TOKEN@*/.multiply/*@END_MENU_TOKEN@*/)
    }
}
    

//struct FahrerDatenEingabe_Previews: PreviewProvider {
//    static var previews: some View {
//        FahrerDatenEingabe(fahrer: Fahrer(id: 1, fahrerNummer: "1", nachName: "Diemer", vorName: "Bernhard"))
//                .previewInterfaceOrientation(.landscapeLeft)
//    }
//}

