//
//  ViewController.swift
//  meta
//
//  Created by Alline Pedreira on 23/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        pageImages = NSArray(objects: "image1","image2","image3")
        let pageControl = UIPageControl.init(frame: CGRectMake(0, UIScreen.mainScreen().bounds.size.height*14/15, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        pageControl.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+40)
        pageControl.backgroundColor = UIColor.clearColor()
        view.addSubview(pageControl)
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MyPageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let initialContentView = self.pageLastAtIndex(0) as TheLastViewController
        let viewControllers = NSArray(object: initialContentView)
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController] , direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        // self.pageViewController.view.frame = CGRectMake(0,100, self.view.frame.size.width, self.view.frame.size.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageLastAtIndex(index: Int) -> TheLastViewController{
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TheLastViewController") as! TheLastViewController
        
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    
    
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! TheLastViewController
        var index = viewController.pageIndex as Int
        
        if( index == 0 || index == NSNotFound){
            return nil
        }
        
        index = index - 1
        
        return self.pageLastAtIndex(index)
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! TheLastViewController
        var index = viewController.pageIndex as Int
        
        if(index == NSNotFound)
        {
            return nil
        }
        index = index + 1
    
        if(index == 3){
            return nil
        }
        return self.pageLastAtIndex(index)
        
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    


}
