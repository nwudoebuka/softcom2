//
//  PageThreeViewController.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/26/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit
import SwiftyJSON

class PageThreeViewController: UIViewController,IpageThreeControl {
    var page1Element1 = String()
    var page1Element2 = String()
    var page1Element3 = String()
    var page1Element4 = String()
    
    var page2Element1 = String()
    var page2Element0 = Bool()
    let pageThreCntr = PageThreeControl()
    var sb:Snackbar? =  nil
    @IBAction func submitAction(_ sender: Any) {
        
        if !pageThreCntr.validateFormOne(page1Element1,page1Element2,page1Element3,page1Element4){
            
            showMessage("some fields are required on screen one")
        }else if !pageThreCntr.validateFormTwo(page2Element1,page2Element0){
            showMessage("some fields are required on screen two")
        }else if !pageThreCntr.validateFormThree(firstelementTextField.text as! String,secondElementTextField.text as! String){
            
            
            showMessage("some fields are required on this screen")
        }else{
            alertWithoutAction("success:","all form validation was successful.")
        }
        
        
        
        
    }
    @IBOutlet var pageLabel: UILabel!
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var firstelementLabel: UILabel!
    @IBOutlet var firstelementTextField: UITextField!
    @IBOutlet var secondElementLabel: UILabel!
    @IBOutlet var secondElementTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageThreCntr.delegate = self
        pageThreCntr.getData()
        
        setKeyboardToolBar()
    }
    
    func setKeyboardToolBar(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = UIColor.lightGray
        toolBar.tintColor = .white
        toolBar.backgroundColor = UIColor.lightGray
        toolBar.barTintColor = .white
        toolBar.tintColor = .blue
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PageTwoViewController.dismiskey))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        secondElementTextField.inputAccessoryView = toolBar
        firstelementTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func cancel(){
        self.view.endEditing(true)
    }
    @objc func dismiskey() {
        
        view.endEditing(true)
    }
    
    
    
    
    func showMessage(_ message:String){
        if(sb == nil){
            sb = Snackbar()
        }
        
        sb?.createWithAction(text: message, actionTitle: "Ok", action: {
            self.sb?.hide();
        })
    }
    
    
    func pageThreeControl(_ pgModel: PageThreeModel) {
        
        
        pageLabel.text = pgModel.pageTitle
        sectionLabel.text = pgModel.sectionTitle
        firstelementLabel.text = pgModel.formFieldOneTitle
        secondElementLabel.text = pgModel.formFieldTwoTitle
        
        
    }
}
