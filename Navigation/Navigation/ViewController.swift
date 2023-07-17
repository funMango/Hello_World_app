//
//  ViewController.swift
//  Navigation
//
//  Created by 이민호 on 2023/07/14.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
        
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scaleRatio: CGFloat = 2.0
        let newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            if orgZoom {
                
            }
            else {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width * scaleRatio
                newHeight = imgView.frame.height * scaleRatio
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if orgZoom {
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width / scaleRatio
                newHeight = imgView.frame.height / scaleRatio
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
        }
    }
}
