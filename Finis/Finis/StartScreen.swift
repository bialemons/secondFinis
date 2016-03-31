//
//  StartScreen.swift
//  meta
//
//  Created by Alline Pedreira on 21/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class StartScreen: KeyboardViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, TableViewCellDelegate {
    
    var semana = 0
    
    let days : [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    let daysNumbers = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27", "28", "29", "30", "31"]
    
    let months: [String] = ["January","February","March","April","May","June","July","August","September","October","November","December"]

    @IBOutlet var monthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var tag: UIButton!
    @IBOutlet weak var addGoal: UITextField!
    @IBOutlet weak var insertGoal: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    
    
//variaveis ncessarias para a construcao do calendario
    var dateLabel: UILabel!
    var dateLabelContainer: UIView!

    //var tasks
     var toDoItems = [ToDoItem]()
    
    
    //seções collectionView para formar o calendário
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 100
    }
    
    // números de itens: 7 dias da semana
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.dayLabel.text = days[indexPath.row]
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        tag.hidden = true
        insertGoal.hidden = true
        addGoal.textColor = UIColor.clearColor()
        
//        navigationController!.navigationBar.tintColor = UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)

        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)]
        
        self.tableView.reloadData()
        
        self.view.bringSubviewToFront(dateLabel)
        
        if toDoItems.count > 0 {
            return
        }
        toDoItems.append(ToDoItem(text: "feed the cat"))
        toDoItems.append(ToDoItem(text: "buy eggs"))
        toDoItems.append(ToDoItem(text: "watch WWDC videos"))
        toDoItems.append(ToDoItem(text: "rule the Web"))
        
        tableView.separatorStyle = .None
        //tableView.rowHeight = 40.0
        
        
    }
    
    @IBAction func add(sender: AnyObject) {
        tag.hidden = false
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
       tag.hidden = false
       insertGoal.hidden = false
        
       //ScrollView.hidden = false
        
       ScrollView.setContentOffset(CGPoint(x: 0, y: 184), animated: true)
        //let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
       // let blurView = UIVisualEffectView(effect: lightBlur)
        
       // blurView.frame = imageView.bounds
       // imageView.addSubview(blurView)
    
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
       tag.hidden = true
       insertGoal.hidden = true
        
        //ScrollView.hidden = true
        
        
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//        for view in self.imageView.subviews{
//            view.removeFromSuperview()
//        }
        
        if insertGoal.text?.isEmpty == false {
            toDoItems.append(ToDoItem(text: insertGoal.text!))
        //tasks.append(insertGoal.text!)
        
       let insertionIndexPath = NSIndexPath(forRow: toDoItems.count - 1, inSection: 0)
        tableView.insertRowsAtIndexPaths([insertionIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            insertGoal.text! = ""
        }
        
        /*tasks.addObject(insertgoal!)
        
        let insertionIndexPath = NSIndexPath(forRow: tasks.count - 1, inSection: 0)
        tableView.insertRowsAtIndexPaths([insertionIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        self.tableView.reloadData()*/

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",
            forIndexPath: indexPath) as! TableViewCell
        let item = toDoItems[indexPath.row]
        cell.toDoItem = item
        cell.titleLabel?.text = item.text
        cell.titleLabel?.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        cell.delegate = self
        cell.toDoItem = item
        return cell
    }
    
    func toDoItemDeleted(toDoItem: ToDoItem) {
    let index = (toDoItems as NSArray).indexOfObject(toDoItem)
    if index == NSNotFound { return }
    
    // could removeAtIndex in the loop but keep it here for when indexOfObject works
    toDoItems.removeAtIndex(index)
    
    // use the UITableView to animate the removal of this row
    tableView.beginUpdates()
    let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
    tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
    tableView.endUpdates()
    }
}
