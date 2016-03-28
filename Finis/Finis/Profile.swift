//
//  Profile.swift
//  Finis
//
//  Created by Alline Pedreira on 27/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class Profile: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
        var imageCircle = UIImageView(frame: CGRectMake(149, 85, 80, 80))
        
        let imagePicker = UIImagePickerController()
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let image = UIView(frame: CGRect(x: 0, y: 64, width: 400, height: 129))
            image.backgroundColor = UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)

            self.view.addSubview(image)
            
            self.imageCircle.image = UIImage(named: "image3")
            imageCircle.layer.cornerRadius = imageCircle.frame.size.height/2
            //imageCircle.layer.borderWidth = 1
            //imageCircle.layer.borderColor = UIColor.grayColor().CGColor
            //imageCircle.layer.backgroundColor = UIColor.grayColor().CGColor
            imageCircle.clipsToBounds = true
            //imageCircle = UIImage(named: "image1")
            
            self.view.addSubview(imageCircle)
            
            
            imagePicker.delegate = self
        }
        
        
        @IBAction func loadImageButtonTapped(sender: UIButton) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .PhotoLibrary
            
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        
        
        // MARK: - UIImagePickerControllerDelegate Methods
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                // imageView.contentMode = .ScaleAspectFit
                imageCircle.image = pickedImage
            }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            dismissViewControllerAnimated(true, completion: nil)
        }



}
