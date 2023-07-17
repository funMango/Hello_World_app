//
//  AddViewController.swift
//  Table
//
//  Created by 이민호 on 2023/07/17.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 40
    var imageArray = [UIImage?]()
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var fileName = ""

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        imgView.image = imageArray[0]
        fileName = imageFileName[0]
    }
    
    @IBAction func btnAdditem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(fileName)
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
        
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = imageArray[row]
        fileName = imageFileName[row]
    }
}
