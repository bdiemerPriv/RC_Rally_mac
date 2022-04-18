//
//  FahrerServices.swift
//  Fahrer
//
//  Created by Bernhard Diemer  on 19.02.22.
//

import Foundation


class FahrerService {
    
//    func leseFahrer() -> [fahrerTab] {
//        var FahrerTabRet = [fahrerTab]()
//
//        let pathString = Bundle.main.path(forResource: "FahrerDaten", ofType: "json")
//        // Wenn Datei existiert
//        if let path = pathString {
//            // Ermittle URL zum auslesen
//            let url = URL(fileURLWithPath: path)
//            // Hole Daten
//            do{
//                let data = try Data(contentsOf: url)
//                // Instanziiere JSON Decoder
//                let decoder = JSONDecoder()
//                do {
//                    let fahrerDaten = try decoder.decode([Fahrer].self, from: data)
//                    for f in fahrerDaten {
//                        var newFahrer = fahrerTab(fahrer: f)
//                        FahrerTabRet.append(newFahrer)
//                    }
//                } catch {
//                    // Decoder
//                    print("Decoder")
//                    print(error)
//                }
//
//            } catch {
//                // Url Fehler
//                print(error)
//            }
//        }
//
//        return FahrerTabRet
//    }
    
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
                        var newFahrer = fahrerTab(fahrer: f)
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
                
//                let pathString = Bundle.main.path(forResource: "FahrerDaten", ofType: "json")
//                if let path = pathString {
//                    // Ermittle URL zum auslesen
//                    let url = URL(fileURLWithPath: path)
////                    let url = getDocumentsDirectory()
//                    // Hole Daten
//                    let json = try JSONEncoder().encode(fahrerT)
//                    do {
//                        try json.write(to: url)
//                        let jsonString2 = String(data: json,
//                                                encoding: .utf8)
//                        print(jsonString2)
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                }
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

/*
    func saveFahrerList(fahrerT:[Fahrer]){
        do {
            let pathString = Bundle.main.path(forResource: "FahrerDaten", ofType: "json")
            if let path = pathString {
                // Ermittle URL zum auslesen
                let url = URL(fileURLWithPath: path)
                // Hole Daten
                let data = JSONEncoder()
                let json = try data.encode(fahrerT)
                do {
                    try json.write(to: url)
                } catch {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }

*/

/*    func leseFahrer() -> [fahrerTab] {
        
        let pathString = Bundle.main.path(forResource: "FahrerDaten", ofType: "json")
        // Wenn Datei existiert
        if let path = pathString {
            // Ermittle URL zum auslesen
            let url = URL(fileURLWithPath: path)
            // Hole Daten
            do{
                let data = try Data(contentsOf: url)
                // Instanziiere JSON Decoder
                let decoder = JSONDecoder()
                do {
                    let fahrerDaten = try decoder.decode([Fahrer].self, from: data)
                    print(fahrerDaten.count)
                    for r in fahrerDaten {
                        var fahrerList = fahrerTab(fahrer:r)
                        fahrerList.id = UUID()
                        
                    }
                    return fahrerDaten
                } catch {
                    // Decoder
                    print("Decoder")
                    print(error)
                }
                
            } catch {
                // Url Fehler
                print(error)
            }
        }
        return [Fahrer]()
    }

    func saveFahrer2(fahrerArray:[Fahrer]) {
        do {
            let pathString = Bundle.main.path(forResource: "FahrerDaten", ofType: "json")
            if let path = pathString {
                // Ermittle URL zum auslesen
                let url = URL(fileURLWithPath: path)
                // Hole Daten
                let data = JSONEncoder()
                let json = try data.encode(fahrerArray, to: Fahrer)
                print(json.count)
                do {
                        try json.write(to: url)
                    } catch {
                        print(error.localizedDescription)
                    }
            }
        } catch {
                print(error.localizedDescription)
            }
        
    }
 */

    
  

