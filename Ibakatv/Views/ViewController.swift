//
//  ViewController.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/24/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    let jsonValue:JSON = [
        "id": "form_1",
        "name": "Pet Adoption Application Form",
        "pages": [
        [
        "label": "Page 1",
        "sections": [
        [
        "label": "Welcome to Pets Rescue",
        "elements": [
        [
        "type": "embeddedphoto",
        "file": "https://images.pexels.com/photos/8700/wall-animal-dog-pet.jpg?cs=srgb&dl=animal-collar-dog-8700.jpg&fm=jpg",
        "unique_id": "embeddedphoto_1",
        "rules": []
        ]
        ]
        ],
        [
        "label": "Basic Info",
        "elements": [
        [
        "type": "text",
        "label": "Your fullname",
        "isMandatory": true,
        "unique_id": "text_1",
        "rules": []
        ],
        [
        "type": "text",
        "label": "Email address",
        "isMandatory": true,
        "unique_id": "text_2",
        "rules": []
        ],
        [
        "type": "formattednumeric",
        "label": "Phone Number",
        "keyboard": "numeric",
        "formattedNumeric": "####-###-####",
        "isMandatory": true,
        "unique_id": "formattednumeric_1",
        "rules": []
        ],
        [
        "type": "datetime",
        "mode": "date",
        "label": "Date of Birth",
        "isMandatory": true,
        "unique_id": "datetime_1",
        "rules": []
        ]
        ]
        ]
        ]
        ],
        [
        "label": "Page 2",
        "sections": [
        [
        "label": "About your home",
        "elements": [
        [
        "type": "yesno",
        "label": "Do you have a yard?",
        "isMandatory": true,
        "unique_id": "yesno_1",
        "rules": [
        [
        "condition": "equals",
        "value": "Yes",
        "action": "show",
        "otherwise": "hide",
        "targets": [
        "text_3"
        ]
        ]
        ]
        ],
        [
        "type": "text",
        "label": "Is it fenced? Also indicate the type",
        "isMandatory": false,
        "unique_id": "text_3",
        "rules": []
        ]
        ]
        ]
        ]
        ],
        [
        "label": "Page 3",
        "sections": [
        [
        "label": "Additional Information",
        "elements": [
        [
        "type": "text",
        "label": "Please provide your veterinarian's name",
        "isMandatory": false,
        "unique_id": "text_4",
        "rules": []
        ],
        [
        "type": "text",
        "label": "Please provide the name of a personal reference",
        "isMandatory": true,
        "unique_id": "text_5",
        "rules": []
        ]
        ]
        ]
        ]
        ]
        ]
    ]
     @IBOutlet var logocenterconstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //print("this is my saved Json \(getJSON("testJson"))")
         readJson()
    }
  

    func animateLogo(){
        let screenSize = UIScreen.main.bounds
        let screenHeight = -screenSize.height/2
       UIView.animate(withDuration: 2) {
            self.logocenterconstraint.constant = screenHeight
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 2) {
            self.logocenterconstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
           self.moveToApp()
        })
    }
    private func readJson(){
             
             let path = Bundle.main.path(forResource: "pet_adoption", ofType: "json")
             let url = URL(fileURLWithPath: path!)
             let data = try! Data(contentsOf: url)
             let obj = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
             
             let str = obj as! NSDictionary
             let json = JSON(str)
             print(" json is \(json)")
        saveJSON(json: json, key: Constants.JSON_KEY)
        animateLogo()
//                 DispatchQueue.global(qos: .background).async {
//                     var stateArr = [String]()
//                     for i in 0...json.count - 1{
//
//                         stateArr.append(json[i]["name"].stringValue)
//                     }
//
//                     UserDefaults.standard.set(stateArr, forKey: Constants.STATE_ARRAY)
//                   print(UserDefaults.standard.stringArray(forKey: Constants.STATE_ARRAY) ?? [String]())
                     
             }
             
             
         
       
    
}

