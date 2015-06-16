//
//  ViewController.swift
//  Project2
//
//  Created by Joanne Koong on 6/16/15.
//  Copyright (c) 2015 joanne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Do any additional setup after loading the view, typically from a nib.
        // countries.append("estonia")
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = Int(arc4random_uniform(3))
        title = countries[correctAnswer].uppercaseString
    }
    @IBAction func buttonTapped(sender: UIButton) {
        var messageTitle: String
        if sender.tag == correctAnswer {
            messageTitle = "Correct"
            ++score
        }
        else {
            messageTitle = "Wrong'"
            --score
        }
        let messageText = "Your score is \(score)."
        
        let ac = UIAlertController(title: messageTitle, message: messageText, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
        
    }

}

