//
//  WertePruefungArray.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer  on 22.04.22.
//

import Foundation

class wertePruefungTab: Identifiable {
    var id: UUID?
    var wertePruefung: WertePruefung
    
    init (wertePruefung:WertePruefung){
        id = UUID()
        self.wertePruefung = wertePruefung
    }
}
