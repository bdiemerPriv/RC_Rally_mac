//
//  FahrerListe.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 15.02.22.
//

import SwiftUI


struct FahrerListe: View {
    
    @EnvironmentObject var fahrerList:FahrerModel
    
    var body: some View {
        NavigationView {
            
            ScrollView{
                
                ForEach(fahrerList.fahrer) { item in
                    NavigationLink(destination: FahrerDatenEingabe(fahrer: item.fahrer),
                                   label: {
                        VStack(alignment: .leading){
                            Text(item.fahrer.getName())
                        }
                    })
                }
                .navigationTitle("Fahrer Liste")
            }.toolbar {
                ToolbarItemGroup() {
                    Button(action: {fahrerList.addFahrer(fahrerNummer: "99", nachName: "Leer", vorName: "Leer")}) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Neuer Fahrer")
                    Button(action: {fahrerList.saveFahrer()}) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .accessibilityLabel("Sichern Fahrer")
                }
            }
        }
    }
}

struct FahrerListe_Previews: PreviewProvider {
    static var previews: some View {
        FahrerListe().environmentObject(FahrerModel()).previewInterfaceOrientation(.landscapeLeft)
    }
}
