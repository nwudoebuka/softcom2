//
//  PageOneModel.swift
//  Ibakatv
//
//  Created by Chukwuebuka Nwudo on 03/06/2020.
//  Copyright © 2020 Nwudo Ebuka. All rights reserved.
//

import Foundation
import SwiftyJSON
protocol IpageThreeModel {
    func pageThreeModel(_ pgModel:PageThreeModel)
}


class PageThreeModel{
    var delegate:IpageThreeModel!
    var pageTitle:String!
    var sectionTitle:String!
    var formFieldOneTitle:String!
    var formFieldOneType:String!
    var formFieldTwoTitle:String!
    var formFieldTwoType:String!

    
    //
    
        static var page1Element1 = String()
      static var page1Element2 = String()
      static var page1Element3 = String()
      static var page2Element0 = Bool()
      static var page2Element1 = String()
      static var page1Element4 = String()
    
    //
    
    
    let async = DispatchGroup()
    init() {
        
          }
          
    func passdata(){
         self.setLabelsFromJson()
    }
    
    func validateFormOne(_ elementOne:String, _ elementTwo:String, _ elementThree:String, _ elementFour:String)->Bool{
        
        if Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][0]["isMandatory"].boolValue && elementOne.isEmpty{
            
               return false
           }
           if Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][1]["isMandatory"].boolValue && elementTwo.isEmpty{
              
               return false
           }
           if Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][2]["isMandatory"].boolValue && elementThree.isEmpty{
            
               return false
           }
           if Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][3]["isMandatory"].boolValue && elementFour.isEmpty{
              
               return false
           }
        
        return true

    }
    
    func validateFormTwo(_ elementOne:String,_ elementTwo:Bool)->Bool{
        
        if Constants.getJSON(Constants.JSON_KEY)["pages"][1]["sections"][0]["elements"][1]["isMandatory"].boolValue && elementOne.isEmpty{
                
                  return false
              }
        
        return true
        
        
    }
    
    
    func validateFormThree(_ elementOne:String,_ elementTwo:String)->Bool{
        
        
        if Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["elements"][0]["isMandatory"].boolValue && elementOne.isEmpty{
                
                 return false
             }
        if Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["elements"][1]["isMandatory"].boolValue && elementTwo.isEmpty{
           
                 return false
             }
        return true
        
    }
    
          func setLabelsFromJson(){
            async.enter()
            
            
            pageTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][2]["label"].stringValue
            sectionTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["label"].stringValue
            formFieldOneTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["elements"][0]["label"].stringValue
              formFieldOneType = Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["elements"][0]["type"].stringValue
            formFieldTwoTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["elements"][1]["label"].stringValue
            
             formFieldTwoType = Constants.getJSON(Constants.JSON_KEY)["pages"][2]["sections"][0]["elements"][1]["type"].stringValue
            
            
              
           
            print("model form is \(self.formFieldOneTitle)")
                          self.delegate.pageThreeModel(self)
              
          }
        
 
    
}
