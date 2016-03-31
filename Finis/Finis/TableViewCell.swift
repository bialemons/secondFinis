//
//  TableViewCell.swift
//  Finis
//
//  Created by Alline Pedreira on 28/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate {
    // indicates that the given item has been deleted
    func toDoItemDeleted(todoItem: ToDoItem)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    // The object that acts as delegate for this cell.
    var delegate: TableViewCellDelegate?
    // The item that this cell renders.
    var toDoItem: ToDoItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //let recognizer = UISwipeGestureRecognizer(target: self, action: Selector("handleTap:"))
        
        var recognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        recognizer.delegate = self
        addGestureRecognizer(recognizer)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    var completeOnDragRelease = false
    
    //MARK: - horizontal pan gesture methods
    func handlePan(recognizer: UIPanGestureRecognizer) {
        
        
        
        // 1
        if recognizer.state == .Began {
            // when the gesture begins, record the current center location
            originalCenter = center
        }
        
        // 2
        if recognizer.state == .Changed {
            let translation = recognizer.translationInView(self)
            center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
            // has the user dragged the item far enough to initiate a delete/complete?
            deleteOnDragRelease = frame.origin.x < -frame.size.width / 4.0
            completeOnDragRelease = frame.origin.x > frame.size.width / 4.0
            //            if frame.origin.x < -frame.size.width / 2.0{
            //                print("esquerdo")
            //            }
            //            else {
            //                print("direito")
            //            }
            //            print(deleteOnDragRelease)
            //            print(completeOnDragRelease)
        }
        
        // 3
        if recognizer.state == .Ended {
            // the frame this cell had before user dragged it
            let originalFrame = CGRect(x: 0, y: frame.origin.y,
                                       width: bounds.size.width, height: bounds.size.height)
            if !deleteOnDragRelease {
                //
                //                UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .CurveEaseOut, animations: {
                //
                //                    titleLabel.frame =
                //
                //                    }, completion: nil)
                //
                print("direita")
                
                //UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
                UIView.animateWithDuration(0.2, animations: {
                    self.frame = originalFrame
                    }, completion: { (Bool) in
                        
                        self.animateLabel()
                })
                
            } else if !completeOnDragRelease {
                print("esquerda")
                
                if toDoItem != nil {
                    toDoItem?.completed = true
                }
                // self.titleLabel.strikeThrough = true
                UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
                
                
            } else {
                UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
                
            }
        }
        
        // 4
        if deleteOnDragRelease {
            if delegate != nil && toDoItem != nil {
                // notify the delegate that this item should be deleted
                delegate!.toDoItemDeleted(toDoItem!)
            }
        }
        
    }
    
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translationInView(superview!)
            if fabs(translation.x) > fabs(translation.y) {
                return true
            }
            return false
        }
        return false
    }
    
    
    func animateLabel(){
        let initial = CGRect(x: 0, y: titleLabel.frame.height/2, width: 0, height: 2.0)
        let strikeView = UIView(frame: initial)
        strikeView.backgroundColor = UIColor.redColor()
        
        titleLabel.addSubview(strikeView)
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .CurveEaseOut, animations: {
            
            strikeView.frame = CGRect(x: 0, y: self.titleLabel.frame.height/2, width: self.titleLabel.frame.width, height: 2.0)
            
            }, completion: nil)
    }
    
    

}
