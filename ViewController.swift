//
//  ViewController.swift
//  OutaTimeSwift
//
//  Created by Oliver Short on 5/12/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DatePickerViewControllerDelegate{
    
    var currentSpeed = 0
    var timing = NSTimer?()
    let dateFormatter = NSDateFormatter()
    let currentDate = NSDate()
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var currentSpeedLabel: UILabel!
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Time Circuits"
        
                                //Improvement from Obj-C
                                //dateFormatter does not need a string to read from
        dateFormatter.dateFormat = "MMM dd YYYY"
        lastTimeDepartedLabel.text = "--- -- ----"
//      destinationTimeLabel.text = "--- -- ----"
        presentTimeLabel.text = dateFormatter.stringFromDate(currentDate)
        currentSpeedLabel.text = "\(currentSpeed) MPH"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func travelBackPushed(sender: AnyObject){
        startTimer()
    }
    
    func startTimer() {
        if (timing == nil) {
            timing = NSTimer.scheduledTimerWithTimeInterval(0.075, target: self, selector: #selector(ViewController.increaseSpeed), userInfo: nil, repeats: true)
        }
        
    }
    
    func stopTimer() {
        timing!.invalidate()
        timing = nil
    }
    
    func increaseSpeed() {
        if currentSpeed != 88 {
            currentSpeed += 1
            currentSpeedLabel.text = "\(currentSpeed) MPH"
        }else{
            stopTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0;
            currentSpeedLabel.text = "\(currentSpeed) MPH"
        }
        
    }

    func grabADate(data: NSDate!) {
        let dateString = dateFormatter.stringFromDate(data)
        destinationTimeLabel.text = dateString
    }

    override func prepareForSegue (segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "datePickerSegue" {
            let destination = segue.destinationViewController as! DatePickerViewController
            destination.delegate = self
        }
    
    }
}
