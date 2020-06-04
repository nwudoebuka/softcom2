//
//  OnboardingPageViewController.swift
//  Ibakatv
//
//  Created by Nwudo Ebuka on 5/24/19.
//  Copyright © 2019 Nwudo Ebuka. All rights reserved.
//

import UIKit

protocol Islided {
    func currentPage(_ index:Int)
}

class OnboardingPageViewController:  UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    private var currentPageIndex: Int!
    static var Onboardingdelegate:Islided!
    var timer = Timer()
    lazy var orderedViewControllers: [UIViewController] = {
        
        return [self.newVC(viewController: "Firstslide"),self.newVC(viewController: "Secondslide"),self.newVC(viewController: "Thirdslide"),self.newVC(viewController: "Fourthslide"),self.newVC(viewController: "Fifthslide")]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentPageIndex = 0
         
        self.dataSource = self
        if let firstViewController = orderedViewControllers.first {
            
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
   
    }
    
    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newVC(viewController: String)->UIViewController{
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)->UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController)else{
            return nil
        }
        currentPageIndex = viewControllerIndex
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex  >= 0 else{
            //returning nil if we try to slide back on the first slide
             OnboardingPageViewController.Onboardingdelegate.currentPage(currentPageIndex)
            return nil
        }
        guard orderedViewControllers.count > previousIndex else{
            
            return nil
        }
        OnboardingPageViewController.Onboardingdelegate.currentPage(currentPageIndex)
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController)else{
            return nil
        }
        currentPageIndex = viewControllerIndex
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else{
            
            //returning nill if we try to slide to next on the last slide
             OnboardingPageViewController.Onboardingdelegate.currentPage(currentPageIndex)
            return nil
        }
        guard orderedViewControllers.count > nextIndex else{
            
            return nil
        }
        OnboardingPageViewController.Onboardingdelegate.currentPage(currentPageIndex)
        return orderedViewControllers[nextIndex]
        
    }
    
    
    
    func displayPageForIndex(index: Int, animated: Bool = true) {
        assert(index >= 0 && index < self.orderedViewControllers.count, "Error: Attempting to display a page for an out of bounds index")
        
        // nop if index == self.currentPageIndex
        //        if self.currentPageIndex == index { return }
        //
        //        if index < self.currentPageIndex {
        //            self.setViewControllers([self.orderedViewControllers[index]], direction: .reverse, animated: true, completion: nil)
        //        } else if index > self.currentPageIndex {
        //            self.setViewControllers([self.orderedViewControllers[index]], direction: .forward, animated: true, completion: nil)
        //        }
        
        self.setViewControllers([self.orderedViewControllers[index]], direction: .forward, animated: true, completion: nil)
        
        self.currentPageIndex = index
    }
    
    
    func displayBackPageForIndex(index: Int, animated: Bool = false) {
        assert(index >= 0 && index < self.orderedViewControllers.count, "Error: Attempting to display a page for an out of bounds index")
        
        // nop if index == self.currentPageIndex
        //        if self.currentPageIndex == index { return }
        //
        //        if index < self.currentPageIndex {
        //            self.setViewControllers([self.orderedViewControllers[index]], direction: .reverse, animated: true, completion: nil)
        //        } else if index > self.currentPageIndex {
        //            self.setViewControllers([self.orderedViewControllers[index]], direction: .forward, animated: true, completion: nil)
        //        }
        
        self.setViewControllers([self.orderedViewControllers[index]], direction: .reverse, animated: true, completion: nil)
        
        self.currentPageIndex = index
       
    }
    
    
    
}
