//
//  FahrerServices.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 19.02.22.
//

import Foundation


class FahrerService {
    
    func leseFahrer() -> [fahrerTab] {
        var FahrerTabRet = [fahrerTab]()
        
        do{
            
     // Ermittle URL zum auslesen
        let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                   .appendingPathComponent("FahrerDaten.json")
            do{
                let data = try Data(contentsOf: path)
                // Instanziiere JSON Decoder
                let decoder = JSONDecoder()
                do {
                    let fahrerDaten = try decoder.decode([Fahrer].self, from: data)
                    for f in fahrerDaten {
                        let newFahrer = fahrerTab(fahrer: f)
                        FahrerTabRet.append(newFahrer)
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
    
        return FahrerTabRet
    }
    
    func saveFahrer(fahrerArray:[fahrerTab]) {
        
        var fahrerL = [Fahrer]()
        for fahrer in fahrerArray {
            fahrerL.append(fahrer.fahrer)
        }
        self.saveFahrerList(fahrerT: fahrerL)
    }

    func saveFahrerList(fahrerT:[Fahrer]){
        do{
            let encodedData = try JSONEncoder().encode(fahrerT)
            let jsonString = String(data: encodedData,
                                    encoding: .utf8)
            print(jsonString)
            do{
                let pathString = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                           .appendingPathComponent("FahrerDaten.json")

                       let encoder = JSONEncoder()
                       try encoder.encode(fahrerT).write(to: pathString)
                
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

    
  

