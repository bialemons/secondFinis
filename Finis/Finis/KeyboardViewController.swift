//
//  KeyboardViewController.swift
//  Finis
//
//  Created by Bia Lemos on 3/28/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    // teclado some quando qualquer lugar da tela é clicado
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        print("saiu do teclado")
    }
    
    
    // teclado some ao clicar na tecla return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
