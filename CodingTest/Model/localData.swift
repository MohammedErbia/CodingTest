//
//  localData.swift
//  CodingTest
//
//  Created by mohammed on 9/7/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import UIKit
 
func saveData(user : Realestates) {
    if let encoded = try? JSONEncoder().encode(user) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "Saveddata")
    }
}
func loaddata(handler: (_ Error : Error? ,_ data : Realestates? )-> Void){
    let defaults = UserDefaults.standard
    if let savedPerson = defaults.object(forKey: "Saveddata") as? Data {
        let decoder = JSONDecoder()
        if let loadedPerson = try? decoder.decode(Realestates.self, from: savedPerson) {
            handler(nil,loadedPerson)
        }
    }else{
        handler(Error.self as? Error,nil)
    }
}
func removedata(){
     let defaults = UserDefaults.standard
    defaults.removeObject(forKey: "Saveddata") 
}
