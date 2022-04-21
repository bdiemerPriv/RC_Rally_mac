//
//  FahrerDat.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 15.02.22.
//

import Foundation

class Fahrer: Codable {
    
//    var id: UUID?
    var fahrerNummer: String
    var nachName: String
    var vorName: String
 
    init (fahrerNummer:String,nachName:String, vorName:String){
//        id = UUID()
        self.fahrerNummer = fahrerNummer
        self.nachName = nachName
        self.vorName = vorName

    }
    
    func getName() -> String {
        var name: String =  ""
        name = self.fahrerNummer + ":" + self.nachName + ", " + self.vorName
        return name
    }
}




