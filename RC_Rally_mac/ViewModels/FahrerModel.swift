//
//  FahrerModel.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 19.02.22.
//

import Foundation

class FahrerModel: ObservableObject {
    
    @Published var fahrer = [fahrerTab]()
    
    init() {
        // Instanziier Daten Service
        let serv = FahrerService()
        // Hole Daten
        self.fahrer = serv.leseFahrer()
    }
    
    func addFahrer(fahrerNummer: String,nachName:String, vorName:String){
        let fahrerNew = Fahrer(fahrerNummer:fahrerNummer,nachName:nachName,vorName:vorName)
        var newFahrer = fahrerTab(fahrer: fahrerNew)
        fahrer.append(newFahrer)
    }
    
    func saveFahrer() {
        let serv = FahrerService()
        serv.saveFahrer(fahrerArray: fahrer)
    }
    
}
    
