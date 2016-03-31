//
//  Register.swift
//  meta
//
//  Created by Alline Pedreira on 21/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class Register: KeyboardViewController, UITextFieldDelegate {

    @IBOutlet var background: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var user: User!
    var userreg: Pessoa!

    //arthur_array do bg
    var images = ["bg1", "bg2", "bg3", "bg4"]
    var previousRandomIndex = 0
    
    
    //arthur_background aleatorio
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
    
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 125), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //background.image = UIImage(named: randomImages())
        
        email.text = String()
        password.text = String()
        
        
        // 247 247 247 1 = branco F7F7F7
        name.setValue(UIColor(red: CGFloat(247.0/255.0), green: CGFloat(247.0/255.0), blue: CGFloat(247.0/255.0), alpha: CGFloat(1.0)), forKeyPath: "_placeholderLabel.textColor")
        email.setValue(UIColor(red: CGFloat(247.0/255.0), green: CGFloat(247.0/255.0), blue: CGFloat(247.0/255.0), alpha: CGFloat(1.0)), forKeyPath: "_placeholderLabel.textColor")
        password.setValue(UIColor(red: CGFloat(247.0/255.0), green: CGFloat(247.0/255.0), blue: CGFloat(247.0/255.0), alpha: CGFloat(1.0)), forKeyPath: "_placeholderLabel.textColor")

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
   

    // checar se o email é válido, contendo @
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    // checar se a senha é válida, contendo mais de 8 caracteres
    func isValidPassword(password: String) -> Bool {
        let number = password.characters.count
        
        if number < 8 {
            return false
        } else {
            return true
        }
    }
    
    
    // realizar o cadastro corretamente
    @IBAction func signUp(sender: AnyObject) {
        let nameSav = name.text
        let emailSav = email.text
        let passwordSav = password.text
        
        if (nameSav!.isEmpty || emailSav!.isEmpty || passwordSav!.isEmpty) {
           
            let alert = UIAlertController(title: "Sign up failed", message: "You must fill in all of the fields.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        } else if isValidEmail(email.text!) == false {
            
            let alert = UIAlertController(title: "Sign up failed", message: "Please enter a valid email address.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        } else if isValidPassword(password.text!) == true {
            
            user = User(name: name.text!, email: email.text!, password: password.text!)
//            userreg = Pessoa(nome: name.text!, email: email.text!, senha: password.text!)
            performSegueWithIdentifier("registerCompleted", sender: self)
            
            
        } else {
            
            let alert = UIAlertController(title: "Sign up failed", message: "Your password must be at least 8 characters long.", preferredStyle: UIAlertControllerStyle.Alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    // se o cadastro for completado, encaminha para a tela de login
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "registerCompleted" {
            let destination:Login=segue.destinationViewController as! Login
//            listaPessoas.append(userreg)
            destination.user2 = user
        }
    }

    
    

}
