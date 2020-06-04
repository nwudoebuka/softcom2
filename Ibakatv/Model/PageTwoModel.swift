//
//  PageOneModel.swift
//  Ibakatv
//
//  Created by Chukwuebuka Nwudo on 03/06/2020.
//  Copyright © 2020 Nwudo Ebuka. All rights reserved.
//

import Foundation
import SwiftyJSON
protocol IpageTwoModel {
    func pageTwoModel(_ pgModel:PageTwoModel)
}


class PageTwoModel{
    var delegate:IpageTwoModel!
    var pageTitle:String!
    var sectionTitle:String!
    var formFieldOneTitle:String!
    var formFieldOneType:String!
    var formFieldTwoTitle:String!
    var formFieldTwoType:String!

    let async = DispatchGroup()
    init() {
        
          }
          
    func passdata(){
         self.setLabelsFromJson()
    }
    
    
          func setLabelsFromJson(){
            async.enter()
            formFieldOneType = Constants.getJSON(Constants.JSON_KEY)["pages"][1]["sections"][0]["elements"][0]["type"].stringValue
           formFieldOneTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][1]["sections"][0]["elements"][0]["label"].stringValue
            pageTitle =   Constants.getJSON(Constants.JSON_KEY)["pages"][1]["label"].stringValue
            
            formFieldTwoType = Constants.getJSON(Constants.JSON_KEY)["pages"][1]["sections"][0]["elements"][1]["type"].stringValue
            formFieldTwoTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][1]["sections"][0]["elements"][1]["label"].stringValue
         sectionTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][1]["sections"][0]["label"].stringValue
             
              
           
            print("model form is \(self.formFieldOneTitle)")
                          self.delegate.pageTwoModel(self)
              
          }
        
 
    
}
