//
//  OnboardingViewController.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/24/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController,Islided {
  
    @IBOutlet var indicatorstackView: UIStackView!
    @IBOutlet var indicatorView1: UIView!
    @IBOutlet var indicatorView2: UIView!
    @IBOutlet var indicatorView3: UIView!
    @IBOutlet var indicatorView4: UIView!
    @IBOutlet var indicatorView5: UIView!
    
    @IBAction func whatchFreeBtnAction(_ sender: Any) {
    }
    @IBOutlet var whatchFreBtnoutlt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       OnboardingPageViewController.Onboardingdelegate = self
        cornerBorder(whatchFreBtnoutlt,15)
        cornerBorder(indicatorView1,Int(5))
   
    }
   
    
    func currentPage(_ index: Int) {
        
        switch index {
        case 0:
            cornerBorder(indicatorView1,Int(5))
            cornerBorder(indicatorView2,Int(0))
            cornerBorder(indicatorView3,Int(0))
            cornerBorder(indicatorView4,Int(0))
            cornerBorder(indicatorView5,Int(0))
            indicatorView1.backgroundColor = UIColor(red: 120/255, green: 174/255, blue: 66/255, alpha: 1)
            indicatorView2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
             indicatorView3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
             indicatorView4.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
             indicatorView5.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            
        case 1:
            cornerBorder(indicatorView2,Int(5))
            cornerBorder(indicatorView1,Int(0))
            cornerBorder(indicatorView3,Int(0))
            cornerBorder(indicatorView4,Int(0))
            cornerBorder(indicatorView5,Int(0))
            indicatorView2.backgroundColor = UIColor(red: 120/255, green: 174/255, blue: 66/255, alpha: 1)
            indicatorView1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView4.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView5.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case 2:
            cornerBorder(indicatorView3,Int(5))
            cornerBorder(indicatorView2,Int(0))
            cornerBorder(indicatorView1,Int(0))
            cornerBorder(indicatorView4,Int(0))
            cornerBorder(indicatorView5,Int(0))
            indicatorView3.backgroundColor = UIColor(red: 120/255, green: 174/255, blue: 66/255, alpha: 1)
            indicatorView2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView4.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView5.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case 3:
            cornerBorder(indicatorView4,Int(5))
            cornerBorder(indicatorView2,Int(0))
            cornerBorder(indicatorView3,Int(0))
            cornerBorder(indicatorView1,Int(0))
            cornerBorder(indicatorView5,Int(0))
            indicatorView4.backgroundColor = UIColor(red: 120/255, green: 174/255, blue: 66/255, alpha: 1)
            indicatorView2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView5.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case 4:
            cornerBorder(indicatorView5,Int(5))
            cornerBorder(indicatorView2,Int(0))
            cornerBorder(indicatorView3,Int(0))
            cornerBorder(indicatorView4,Int(0))
            cornerBorder(indicatorView1,Int(0))
            indicatorView5.backgroundColor = UIColor(red: 120/255, green: 174/255, blue: 66/255, alpha: 1)
            indicatorView2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView4.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        default:
            indicatorView1.backgroundColor = UIColor(red: 120/255, green: 174/255, blue: 66/255, alpha: 1)
            indicatorView2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView4.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            indicatorView5.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
    }
    

}
