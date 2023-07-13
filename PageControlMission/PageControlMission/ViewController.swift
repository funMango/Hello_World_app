//
//  ViewController.swift
//  PageControlMission
//
//  Created by 이민호 on 2023/07/13.
//

import UIKit

let NUM_PAGE = 10

class ViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var numberView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = NUM_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        numberView.text = String(pageControl.currentPage + 1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        numberView.text = String(pageControl.currentPage + 1)
    }    
}

