//
//  DatePickerViewController.swift
//  OutaTimeSwift
//
//  Created by Oliver Short on 5/12/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate {
    func grabADate(data: NSDate!)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate : DatePickerViewControllerDelegate?
    var data : NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Pick a Date!"
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.delegate?.grabADate(datePicker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}