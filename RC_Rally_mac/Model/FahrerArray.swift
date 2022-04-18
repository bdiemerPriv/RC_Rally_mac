//
//  FahrerArray.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 21.02.22.
//

import Foundation

class fahrerTab: Identifiable {
    var id: UUID?
    var fahrer: Fahrer
    
    init (fahrer:Fahrer){
        id = UUID()
        self.fahrer = fahrer
    }
}
