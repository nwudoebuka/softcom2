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
protocol IpageOneControl {
    func pageOneControl(_ pgModel:PageOneModel)
}


class PageOneControl:IpageOneModel{
    
    var delegate:IpageOneControl!
  
    func getData(){
        let pageOneModel = PageOneModel()
               pageOneModel.delegate = self
        pageOneModel.passdata()
    }
    func pageOneModel(_ pgModel: PageOneModel) {
        print("form title is \(pgModel.formFieldOneTitle)")
        delegate.pageOneControl(pgModel)
    }
    




}
