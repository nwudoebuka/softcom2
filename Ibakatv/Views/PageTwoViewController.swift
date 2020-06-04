//
//  PageTwoViewController.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/26/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate,IpageTwoControl {
        var page1Element1 = String()
        var page1Element2 = String()
        var page1Element3 = String()
        var page1Element4 = String()
    @IBOutlet var secondElementLabel: UILabel!
    @IBOutlet var secondElementTextField: UITextField!
     @IBOutlet var firstElementTextField: UITextField!
    @IBOutlet var pageLabel: UILabel!
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var firstElementLabel: UILabel!
    var fieldOneType = String()
    let pageTwoContrl = PageTwoControl()
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
     
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
               return pickerData.count
          }
         func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return pickerData[row]
         }
         
         func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
            if pickerData[row] == "Yes"{
             secondElementLabel.isHidden = false
                          secondElementTextField.isHidden = false
            }else{
                secondElementLabel.isHidden = true
                             secondElementTextField.isHidden = true
            }
             pickedTextV.text = pickerData[row]
             
         }
      
     
     

     
     var pickerV = UIPickerView()
    var pickerData = ["select an option","Yes","No"]
    var pickedTextV = UITextField()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstElementTextField.delegate = self
        pageTwoContrl.delegate = self
        pageTwoContrl.getData()
       // setLabels()
        setKeyboardToolBar()
        
    }
    
     func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if fieldOneType == "yesno"{
            pickedTextV = textField
            addPicker(textField)
        }
        
     return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let threeVC = segue.destination as! PageThreeViewController
        
        
        threeVC.page1Element1 = page1Element1
       threeVC.page1Element2 = page1Element2
        threeVC.page1Element3 = page1Element3
        threeVC.page1Element4 = page1Element4
            
        var page2Element1 = secondElementTextField.text!
        var page2Element0 = Bool()
        

        if firstElementTextField.text == "Yes"{
          
            threeVC.page2Element0 = true
        }else{
             threeVC.page2Element0 = false
         
        }
        
        
        
    }
    @objc func donePicker(){
               self.view.endEditing(true)
           }
           func addPicker(_ txt:UITextField){
               
               let picker: UIPickerView
               picker = UIPickerView()
               //picker.backgroundColor = UIC

               picker.showsSelectionIndicator = true
               picker.delegate = self
               picker.dataSource = self

               let toolBar = UIToolbar()
               toolBar.barStyle = UIBarStyle.default
               toolBar.isTranslucent = true
  //             toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
               toolBar.sizeToFit()

               let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.donePicker))
               let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
               let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.donePicker))

               toolBar.setItems([cancelButton, spaceButton,doneButton], animated: false)
               toolBar.isUserInteractionEnabled = true

               txt.inputView = picker
               txt.inputAccessoryView = toolBar
               
               
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
        
    }
    
    @objc func cancel(){
                self.view.endEditing(true)
              }
       @objc func dismiskey() {
           
           view.endEditing(true)
       }
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//       if firstElementTextField.text!.isEmpty || firstElementTextField.text == "select an option"{
//         alertWithoutAction("empty:","please fill all field(s)")
//        return false
//
//
//       }else if firstElementTextField.text == "Yes"{
//        if secondElementTextField.text!.isEmpty{
//                       alertWithoutAction("empty:","please fill all field(s)")
//                    return false
//               }
//        }
//        return true
//    }
    
    func pageTwoControl(_ pgModel: PageTwoModel) {
        fieldOneType = pgModel.formFieldOneType
        if fieldOneType == "yesno"{
            firstElementTextField.text = pickerData.first
            
        }
        pageLabel.text = pgModel.pageTitle
      sectionLabel.text = pgModel.sectionTitle
        firstElementLabel.text = pgModel.formFieldOneTitle
       secondElementLabel.text =  pgModel.formFieldTwoTitle
     
       }
}
