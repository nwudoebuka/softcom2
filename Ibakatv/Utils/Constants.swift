//
//  Constants.swift
//  Ibakatv
//
//  Created by Chukwuebuka Nwudo on 03/06/2020.
//  Copyright © 2020 Nwudo Ebuka. All rights reserved.
//

import Foundation
import SwiftyJSON
class Constants{
    
    static let JSON_KEY = "testJson"
    
    
    
    static func saveJSON(json: JSON, key:String){
           let defaults = UserDefaults.standard
           let jsonString = json.rawString()!
           defaults.setValue(jsonString, forKey: key)
           defaults.synchronize()
       }
       
       static func getJSON(_ key: String)->JSON {
           var p = ""
           let defaults = UserDefaults.standard
           if let buildNumber = defaults.value(forKey: key) as? String {
               p = buildNumber
           }else {
               p = ""
           }
           if  p != "" {
               if let json = p.data(using: String.Encoding.utf8, allowLossyConversion: false) {
                   return try! JSON(data: json)
               } else {
                   return JSON("nil")
               }
           } else {
               return JSON("nil")
           }
       }
}
