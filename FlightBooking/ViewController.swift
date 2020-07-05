//
//  ViewController.swift
//  FlightBooking
//
//  Created by JSMAC on 2020/07/05.
//  Copyright © 2020 JSPRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var departureDateButton: UIButton!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var returnDateButton: UIButton!
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    var buttonTag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }

    @IBAction func showDatePickerAction(_ sender: UIButton) {
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        } else {
            selectDatePicker.isHidden = false
        }
        buttonTag = sender.tag
    }
    
    @IBAction func showReturnDatePickerAction(_ sender: UISwitch) {
//        if sender.isOn {
//            returnDateButton.isHidden = false
//            returnDateLabel.isHidden = false
//        } else {
//            returnDateButton.isHidden = true
//            returnDateLabel.isHidden = true
//        }
        returnDateButton.isHidden = !sender.isOn
        returnDateLabel.isHidden = !sender.isOn
    }
    @IBAction func selectedDateAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        let dateString = formatter.string(from: sender.date)
        
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: .normal)
        } else {
            returnDateButton.setTitle(dateString, for: .normal)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        selectDatePicker.isHidden = true
    }
}

