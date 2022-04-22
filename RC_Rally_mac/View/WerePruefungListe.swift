//
//  WerePruefungListe.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer  on 22.04.22.
//

import SwiftUI


struct WPListe: View {
    
    @EnvironmentObject var wpList:WertePruefungModel
    
    var body: some View {
        NavigationView {
//            ScrollView{
            List {
                ForEach(wpList.wertePruefungen) { item in
                    NavigationLink(destination: PruefungDatenEingabe(wertePruefung: item.wertePruefung),
                                   label: {
                        VStack(alignment: .leading){
                            Text(item.wertePruefung.getName())
                        }
                    })
//                }.aspectRatio(contentMode: .fill)
                .navigationTitle("Werte Prüfungen Liste")
            }.toolbar {
                ToolbarItemGroup() {
                    Button(action: {wpList.addPruefung(wertePruefungNummer: "99", wertePruefungName: "Leer")}) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Neue Werte Prüfung")
                    Button(action: {wpList.savePruefungen()}) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .accessibilityLabel("Sichern Werte Prüfungen")
                }
            }
            }
        }.navigationTitle("Werte Prüfungen Liste")
   }
}

struct WPListe_Previews: PreviewProvider {
    static var previews: some View {
        FahrerListe().environmentObject(WertePruefungModel()).previewInterfaceOrientation(.landscapeLeft)
    }
}
