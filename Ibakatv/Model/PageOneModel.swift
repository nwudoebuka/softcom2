//
//  PageOneModel.swift
//  Ibakatv
//
//  Created by Chukwuebuka Nwudo on 03/06/2020.
//  Copyright © 2020 Nwudo Ebuka. All rights reserved.
//

import Foundation
import SwiftyJSON
protocol IpageOneModel {
    func pageOneModel(_ pgModel:PageOneModel)
}


class PageOneModel{
    var delegate:IpageOneModel!
    var pageTitle:String!
    var pageSubtitle:String!
    var formTitle:String!
    var formFieldOneTitle:String!
    var formFieldOneType:String!
    var formFieldTwoTitle:String!
    var formFieldTwoType:String!
    var formFieldThreeTitle:String!
    var formFieldThreeType:String!
    var formFieldFourTitle:String!
    var formFieldFourType:String!
    var pageImg:UIImage!
    var pageImgUrl:String!
    let async = DispatchGroup()
    init() {
        
       pageImgUrl = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][0]["elements"][0]["file"].stringValue
       
     
        
       // print("image url is \(imgUrl)")
             // loadImageFromUrl(imgUrl)
          }
          
    func passdata(){
         self.setLabelsFromJson()
    }
    
    
          func setLabelsFromJson(){
            async.enter()
            pageTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["label"].stringValue
              pageSubtitle = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][0]["label"].stringValue
              formTitle  = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["label"].stringValue
             formFieldOneTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][0]["label"].stringValue
            
            
            formFieldOneType = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][0]["type"].stringValue
            
               formFieldTwoTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][1]["label"].stringValue
            
            formFieldTwoType = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][1]["type"].stringValue
               formFieldThreeTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][2]["label"].stringValue
            formFieldThreeType = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][2]["type"].stringValue
              formFieldFourTitle = Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][3]["label"].stringValue
           formFieldFourType =  Constants.getJSON(Constants.JSON_KEY)["pages"][0]["sections"][1]["elements"][3]["type"].stringValue
              
           
            print("model form is \(self.formFieldOneTitle)")
                          self.delegate.pageOneModel(self)
              
          }
        
 
    
}
