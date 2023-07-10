//
//  ViewController.swift
//  ImageViewer
//
//  Created by 이민호 on 2023/07/10.
//

import UIKit

class ViewController: UIViewController {
    let MAX_IMAGE = 6
    let MIN_IMAGE = 1
    var numImage = 1
    
    @IBOutlet var btn_next: UIButton!
    @IBOutlet var btn_prev: UIButton!
    @IBOutlet var imgGallery: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgGallery.image = UIImage(named: "1.png")
    }
    
    @IBAction func btnPrevImage(_ sender: UIButton) {
        numImage -= 1
        if (numImage < 1) {
            numImage = MAX_IMAGE
        }
        imgGallery.image = UIImage(named: "\(numImage).png")
        
    }
    
    @IBAction func btnNextImage(_ sender: UIButton) {
        numImage += 1
        if (numImage > 6) {
            numImage = MIN_IMAGE
            
        }
        imgGallery.image = UIImage(named: "\(numImage).png")
    }
}
