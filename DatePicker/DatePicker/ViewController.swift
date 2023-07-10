//
//  ViewController.swift
//  DatePicker
//
//  Created by 이민호 on 2023/07/10.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let inteval = 1.0
    var count = 0
    
    @IBOutlet var IblCurrentTime: UILabel!
    @IBOutlet var IblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: inteval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
//        IblCurrentTime.text = String(count)
//        count += 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm:ss"
        IblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
}
