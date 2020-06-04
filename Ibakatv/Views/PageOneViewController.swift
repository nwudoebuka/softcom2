//
//  PageOneViewController.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/25/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit
import SwiftyJSON
class PageOneViewController: UIViewController,IpageOneControl {
    func pageOneControl(_ pgModel: PageOneModel) {
     
        pageLabel.text = pgModel.pageTitle
        sectionLabel.text = pgModel.pageSubtitle
        infoLabelHead.text = pgModel.formTitle
        infoLabel1.text = pgModel.formFieldOneTitle
        infoLabel2.text = pgModel.formFieldTwoTitle
        infoLabel3.text = pgModel.formFieldThreeTitle
        infoLabel4.text = pgModel.formFieldFourTitle
        self.image.image = pgModel.pageImg
        loadImageFromUrl(pgModel.pageImgUrl)
        inputType(pgModel.formFieldOneType,textField1)
        inputType(pgModel.formFieldTwoType,textField2)
        inputType(pgModel.formFieldThreeType,textfield3)
        inputType(pgModel.formFieldFourType,textfield4)
    }
    let pgController = PageOneControl()
    @IBOutlet var pageLabel: UILabel!
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var infoLabelHead: UILabel!
    @IBOutlet var infoLabel1: UILabel!
    @IBOutlet var infoLabel2: UILabel!
    @IBOutlet var infoLabel3: UILabel!
    @IBOutlet var infoLabel4: UILabel!
    private var datepicker: UIDatePicker?
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textfield3: UITextField!
    @IBOutlet var textfield4: UITextField!
    var datTxt = UITextField()
    var textFieldArray:[UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboardToolBar()
        
        pgController.delegate = self
        pgController.getData()
        adjustOriginOnKeyboardShow(vc: PageOneViewController(), adjustmentHeight: 150)
        loading.startAnimating()
         textFieldArray = [textField1,textField2,textfield3,textfield4]
   
 
    }
    
    
    func loadImageFromUrl(_ urlImg:String){
        let catPictureURL = URL(string: urlImg)!
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            if let e = error {
              self.alert(msg: "Error downloading test picture: \(e)",stat: "failed")
            } else {
              
                if let res = response as? HTTPURLResponse {
                    if let imageData = data {
                        let urlImage = UIImage(data: imageData)
                         DispatchQueue.main.async {
                            self.loading.stopAnimating()
                            self.loading.isHidden = true
                        self.image.image = urlImage
                        }
              
                    } else {
                        print("Couldn't get image: Image is nil")
                        self.alert(msg: "Couldn't get image: Image is nil",stat: "failed")
                    }
                } else {
                   self.alert(msg: "Couldn't get response code for some reason",stat: "failed")
                }
            }
        }
        
        downloadPicTask.resume()
        
    }
  

    
    func inputType(_ type:String, _ txtFD:UITextField){
        print(index)
        switch type {
        case "formattednumeric":
            txtFD.keyboardType = .numberPad
        case "datetime":
            datTxt = txtFD
            
            datePickers(txtFD)
        default:
            print("is default")
        }
        
    }
    
    
    func datePickers(_ textFd:UITextField) {
       
        datepicker  =  UIDatePicker()
        datepicker?.datePickerMode = .date
        textFd.inputView = datepicker
        datepicker?.addTarget(self, action: #selector(PageOneViewController.dateChanged(datepicker:)), for: .valueChanged)
        datepicker?.backgroundColor = UIColor.white
        
        
       
        
        
    }
   
               
     
           @objc func cancelDatePicker(){
             self.view.endEditing(true)
           }
    @objc func dismiskey() {
        
        view.endEditing(true)
    }
    
    @objc func dateChanged(datepicker: UIDatePicker){
        
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        datTxt.text = dateformat.string(from: datepicker.date)
    
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
    
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PageOneViewController.dismiskey))
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
         let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
    
        textField1.inputAccessoryView = toolBar
        textField2.inputAccessoryView = toolBar
        textfield3.inputAccessoryView = toolBar
        textfield4.inputAccessoryView = toolBar
        
    
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let twoVC = segue.destination as! PageTwoViewController
        twoVC.page1Element1 = textField1.text!
        
        twoVC.page1Element2 = textField2.text!
        twoVC.page1Element3 = textfield3.text!
        twoVC.page1Element4 = textfield4.text!

    }


    
    
    
}
