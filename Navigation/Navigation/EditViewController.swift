//
//  EditViewController.swift
//  Navigation
//
//  Created by 이민호 on 2023/07/14.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller:EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swisOn: UISwitch!    
    @IBOutlet var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swisOn.isOn = isOn
        if isZoom {
            btnZoom.setTitle("축소", for: UIControl.State())
        } else {
            btnZoom.setTitle("확대", for: UIControl.State())
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
            
    @IBAction func btnZoom(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            btnZoom.setTitle("확대", for: UIControl.State())
            
        } else {
            isZoom = true
            btnZoom.setTitle("축소", for: UIControl.State())
        }
    }
}
