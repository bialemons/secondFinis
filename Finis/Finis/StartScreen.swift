//
//  StartScreen.swift
//  meta
//
//  Created by Alline Pedreira on 21/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import UIKit

class StartScreen: KeyboardViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate{
    
    enum daysOfWeek {
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var tag: UIButton!
    @IBOutlet weak var addGoal: UITextField!
    @IBOutlet weak var insertGoal: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    //calendar: Tomorrow está instanciando dentro de ViewDidLoad
    let today = NSDate()
    @IBOutlet var todayLabel: UILabel!
    @IBOutlet var tomorrowLabel: UILabel!
    
    //var tasks: NSMutableArray! = NSMutableArray()
    var tasks: [String] = [ "DESIGN INTERFACE", "CLEAN MESSY ROOM", "WATCH DAREDEVIL", "EAT VEGETABLES", "PAY BILLS", "REPLY EMAILS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // label que mostra today

        //let currentDate = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        

        
        let currentDate = NSDate()
        todayLabel.text = dateFormatter.stringFromDate(currentDate)

        dateFormatter.dateFormat = "EEEE"
       // let dayOfWeek = dateFormatter.stringFromDate(currentDate)
        
        
        
        
        
        //label que mostra tomorrow
        let tomorrow = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 1,
            toDate: today,
            options: NSCalendarOptions(rawValue: 0))
        
      

        

        
        
        


            
        tag.hidden = true
        insertGoal.hidden = true
        addGoal.textColor = UIColor.clearColor()
        
//        navigationController!.navigationBar.tintColor = UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)

        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 78.0/255, green: 205.0/255, blue: 196.0/255, alpha: 1.0)]
        
        //Fundo da Navigation Controller
//        navigationController!.navigationBar.barTintColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        
        //tasks += [ "DESIGN INTERFACE","CLEAN MESSY ROOM","WATCH DAREDEVIL","EAT VEGETABLES","PAY BILLS","REPLY EMAILS"]
        
        /*self.tasks.addObject("DESIGN INTERFACE")
        self.tasks.addObject("CLEAN MESSY ROOM")
        self.tasks.addObject("WATCH DAREDEVIL")
        self.tasks.addObject("EAT VEGETABLES")
        self.tasks.addObject("PAY BILLS")
        self.tasks.addObject("REPLY EMAILS")*/
    
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func add(sender: AnyObject) {
        tag.hidden = false
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
       tag.hidden = false
       insertGoal.hidden = false
        
       //ScrollView.hidden = false
        
       ScrollView.setContentOffset(CGPoint(x: 0, y: 184), animated: true)
        let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: lightBlur)
        
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
    
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
       tag.hidden = true
       insertGoal.hidden = true
        
        //ScrollView.hidden = true
        
        
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        for view in self.imageView.subviews{
            view.removeFromSuperview()
        }
        
        if insertGoal.text?.isEmpty == false {
        tasks.append(insertGoal.text!)
        
       let insertionIndexPath = NSIndexPath(forRow: tasks.count - 1, inSection: 0)
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
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        //cell.titleLabel.text = self.tasks.objectAtIndex(indexPath.row) as? String
        cell.titleLabel.text = tasks[indexPath.row]
    
        return cell
    }
    
    
    
}
