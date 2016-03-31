//
//  Login.swift
//  meta
//
//  Created by Alline Pedreira on 21/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class Login: KeyboardViewController, UITextFieldDelegate {
    
    var user2: User!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    var previousRandomIndex = 0
    @IBOutlet var background: UIImageView!
    
    @IBOutlet weak var ScrollView: UIScrollView!

    //arthur_array de imagens para serem geradas aleatoriamente no background
    let images: [String] = ["bg1", "bg2", "bg3", "bg4"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.text1.delegate = self
        self.text2.delegate = self
        
        
        text1.setValue(UIColor(red: CGFloat(247.0/255.0), green: CGFloat(247.0/255.0), blue: CGFloat(247.0/255.0), alpha: CGFloat(1.0)), forKeyPath: "_placeholderLabel.textColor")
        text2.setValue(UIColor(red: CGFloat(247.0/255.0), green: CGFloat(247.0/255.0), blue: CGFloat(247.0/255.0), alpha: CGFloat(1.0)), forKeyPath: "_placeholderLabel.textColor")
    
//       background.image = UIImage(named: randomImages())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    //MARK: Processamentos
    
    
    //arthur_Fazer aparecer imagens para o background aleatoriamente
//    func randomImages () -> String {
//        
//        let unsignedArrayCount = UInt32(images.count)
//        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
//        var randomNumber = Int(unsignedRandomNumber)
//        
//        repeat {
//            randomNumber = Int(unsignedRandomNumber)
//        } while randomNumber == previousRandomIndex
//        
//        return images[randomNumber]
//    }
//    

    
    func textFieldDidBeginEditing(textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 125), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    
    @IBAction func login(sender: AnyObject) {
        if shouldPerformSegueWithIdentifier("start", sender:self) == true {
            performSegueWithIdentifier("start" ,sender: self)
        }
    }
    
    

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "register" {
            performSegueWithIdentifier("register", sender: self)
        } else {
            if identifier == "back" {
                performSegueWithIdentifier("back", sender: self)
            }
            else {
        if (text1.text!.isEmpty||text2.text!.isEmpty) {
            
            let alert = UIAlertController(title: "Error", message: "Please insert your email address and password.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
        if identifier == "start" {
           // print("cu")
            if text1.text != user2.email {
                
                let alert1 = UIAlertController(title: "Error", message: "Your email address is not registered.", preferredStyle: UIAlertControllerStyle.Alert)
                
                // add an action (button)
                alert1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                // show the alert
                self.presentViewController(alert1, animated: true, completion: nil)
                
                return false
            } else {
                if text2.text != user2.password {
                    
                    
                    let alert2 = UIAlertController(title: "Please try again", message: "This email and password do not match.", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // add an action (button)
                    alert2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    // show the alert
                    self.presentViewController(alert2, animated: true, completion: nil)
                    
                    return false
                }
                else
                {
                    return true
                }
            }
            
        }
        return true
    }
        return true
    }
        return true
    }
    return true
    }
}
    
