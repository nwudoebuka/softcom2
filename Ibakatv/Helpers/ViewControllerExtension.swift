//
//  ViewControllerExtension.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/24/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit
import SwiftyJSON
private var newHeight: Int = 0;
extension UIViewController{
  
    func cornerBorder(_ item:UIView,_ rad:Int){
        item.layer.masksToBounds = false
        item.layer.shadowOffset = CGSize(width: -1, height: 1)
        item.layer.shadowRadius = 5
        item.layer.shadowOpacity = 0.2
        item.layer.cornerRadius = CGFloat(rad)
        item.clipsToBounds = false
        
    }
    
    func moveToApp(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "navVC") as! UINavigationController
        newViewController.modalPresentationStyle = .overCurrentContext
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func saveJSON(json: JSON, key:String){
        let defaults = UserDefaults.standard
        let jsonString = json.rawString()!
        defaults.setValue(jsonString, forKey: key)
        defaults.synchronize()
    }
    func alertWithoutAction(_ title:String,_ msg:String){
           
           // Create the alert controller
           var msgs = msg
           if msg.isEmpty{
               msgs = "an error occured"
           }
           let alertController = UIAlertController(title: title, message: msgs, preferredStyle: .alert)
           
           // Create the actions
           let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
               UIAlertAction in
               
           }
           
           // Add the actions
           alertController.addAction(okAction)
           
           // Present the controller
           self.present(alertController, animated: true, completion: nil)
           
       }
    func getJSON(_ key: String)->JSON {
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
    
    
    func alert(msg: String,stat: String){
      let alertController = UIAlertController(title: stat, message:
            msg, preferredStyle: UIAlertController.Style.alert)
       
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler:
            
            { (action) in
                alertController.dismiss(animated: true, completion: nil)
                
        }
            
        ))
       self.present(alertController, animated: true, completion: nil)
   }

    
    func adjustOriginOnKeyboardShow(vc: UIViewController, adjustmentHeight: Int) {
        
        guard adjustmentHeight > 0 else {
            return
        }
        
        newHeight = adjustmentHeight
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                //self.view.frame.origin.y -= keyboardSize.height
                self.view.frame.origin.y -= CGFloat(newHeight)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}
