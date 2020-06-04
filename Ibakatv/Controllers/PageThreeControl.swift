//
//  PageOneController.swift
//  Ibakatv
//
//  Created by Chukwuebuka Nwudo on 03/06/2020.
//  Copyright © 2020 Nwudo Ebuka. All rights reserved.
//

import Foundation
import Foundation
import SwiftyJSON
protocol IpageThreeControl {
    func pageThreeControl(_ pgModel:PageThreeModel)
}


class PageThreeControl:IpageThreeModel{
    
    var delegate:IpageThreeControl!
    var pageThreeModel:PageThreeModel!
    func getData(){
        pageThreeModel = PageThreeModel()
        pageThreeModel.delegate = self
        pageThreeModel.passdata()
    }
    func pageThreeModel(_ pgModel: PageThreeModel) {
        print("form title is \(pgModel.formFieldOneTitle)")
        delegate.pageThreeControl(pgModel)
    }
    
    func validateFormOne(_ elementOne:String, _ elementTwo:String, _ elementThree:String, _ elementFour:String)->Bool{
        
        return pageThreeModel.validateFormOne(elementOne,elementTwo,elementThree,elementFour)
    }

    
    func validateFormTwo(_ elementOne:String,_ elementTwo:Bool)->Bool{
         return pageThreeModel.validateFormTwo(elementOne,elementTwo)
        
        
    }

    func validateFormThree(_ elementOne:String, _ elementTwo:String)->Bool{
        
        return pageThreeModel.validateFormThree(elementOne,elementTwo)
    }


}
