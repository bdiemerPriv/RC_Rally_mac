//
//  WertePruefungDat.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer on 21.04.22.
//

import Foundation

class WertePruefung: Codable {
    
    var wpNummer : String
    var wpName : String

    init (wpNummer:String,wpName:String){
        self.wpNummer = wpNummer
        self.wpName = wpName
    }
    
    func getName() -> String {
        var name: String =  ""
        name = self.wpNummer + ":" + self.wpName
        return name
    }
}
