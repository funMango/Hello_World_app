//
//  ViewController.swift
//  DatePicker
//
//  Created by 이민호 on 2023/07/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var IblCurrentTime: UILabel!
    @IBOutlet var IblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
}
