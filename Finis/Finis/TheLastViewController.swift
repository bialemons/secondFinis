//
//  TheLastViewController.swift
//  meta
//
//  Created by Alline Pedreira on 23/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class TheLastViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var imageFileName: String!
    var pageIndex: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)
        myImageView.backgroundColor = UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)
        
        myImageView.image = UIImage(named: imageFileName)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
