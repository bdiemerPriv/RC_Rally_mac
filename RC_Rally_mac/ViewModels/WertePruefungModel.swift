//
//  WertePruefungModel.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer  on 22.04.22.
//

import Foundation

class WertePruefungModel: ObservableObject {
    
    @Published var wertePruefungen = [wertePruefungTab]()
    
    init() {
        // Instanziier Daten Service
        let serv = WertePruefungService()
        // Hole Daten
        self.wertePruefungen = serv.leseWps()
    }
    
    func addPruefung(wertePruefungNummer: String,wertePruefungName:String){
        let wertePruefungNew = WertePruefung(wpNummer: wertePruefungNummer,wpName: wertePruefungName)
        let newWertePruefung = wertePruefungTab(wertePruefung: wertePruefungNew)
        wertePruefungen.append(newWertePruefung)
    }
    
    func savePruefungen() {
        let serv = WertePruefungService()
        serv.savePruefung(pruefungArray: wertePruefungen)
    }
    
}
    
