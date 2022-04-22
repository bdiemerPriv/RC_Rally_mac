//
//  WertePruefungServices.swift
//  RC_Rally_mac
//
//  Created by Bernhard Diemer  on 22.04.22.
//

import Foundation

class WertePruefungService {
    
    func leseWps() -> [wertePruefungTab] {
        var WertePruefungTabRet = [wertePruefungTab]()
        
        do{
            
     // Ermittle URL zum auslesen
        let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent("WertePruefungen.json")
            do{
                let data = try Data(contentsOf: path)
                // Instanziiere JSON Decoder
                let decoder = JSONDecoder()
                do {
                    let wertePruefungDaten = try decoder.decode([WertePruefung].self, from: data)
                    for f in wertePruefungDaten {
                        let newPruefung = wertePruefungTab(wertePruefung: f)
                        WertePruefungTabRet.append(newPruefung)
                    }
                } catch {
                    // Decoder
                    print("Decoder")
                    print(error)
                }
                
            } catch {
                // Url Fehler
                print(error)
            }
        } catch {
            print(error.localizedDescription)
        }
    
        return WertePruefungTabRet
    }
    
    func savePruefung(pruefungArray:[wertePruefungTab]) {
        
        var pruefungL = [WertePruefung]()
        for pruefung in pruefungArray {
            pruefungL.append(pruefung.wertePruefung)
        }
        self.savePruefungenList(pruefungenT: pruefungL)
    }

    func savePruefungenList(pruefungenT:[WertePruefung]){
        do{
            let encodedData = try JSONEncoder().encode(pruefungenT)
            let jsonString = String(data: encodedData,
                                    encoding: .utf8)
            print(jsonString)
            do{
                let pathString = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                           .appendingPathComponent("WertePruefungen.json")

                       let encoder = JSONEncoder()
                       try encoder.encode(pruefungenT).write(to: pathString)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        }catch{
            
        }
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
}
