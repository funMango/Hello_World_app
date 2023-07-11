//
//  ViewController.swift
//  AlarmClock
//
//  Created by 이민호 on 2023/07/11.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: String?
    var alertFlag = false

    @IBOutlet var SelectTime: UILabel!
    @IBOutlet var CurrentTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd (EEE) HH:mm "
        SelectTime.text = formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd (EEE) HH:mm:ss "
        CurrentTime.text = formatter.string(from: date as Date)

        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)

        if (alarmTime == currentTime) {
            if !alertFlag {
                let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertController.Style.alert)
                let alarmComfirm = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                alarmAlert.addAction(alarmComfirm)
                present(alarmAlert, animated: true, completion: nil)
                alertFlag = true
            }
        } else {
             alertFlag = false
        }
    }
}
