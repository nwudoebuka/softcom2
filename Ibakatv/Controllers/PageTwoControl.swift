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
protocol IpageTwoControl {
    func pageTwoControl(_ pgModel:PageTwoModel)
}


class PageTwoControl:IpageTwoModel{
    
    var delegate:IpageTwoControl!
  
    func getData(){
        let pageTwoModel = PageTwoModel()
               pageTwoModel.delegate = self
        pageTwoModel.passdata()
    }
    func pageTwoModel(_ pgModel: PageTwoModel) {
        print("form title is \(pgModel.formFieldOneTitle)")
        delegate.pageTwoControl(pgModel)
    }
    




}
