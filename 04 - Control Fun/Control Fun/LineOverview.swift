//
//  LineOverview.swift
//  Control Fun
//
//  Created by Nigel Lee on 15/06/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

import Foundation
import UIKit

class LineOverview: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var startJourneyButton: UIButton!
    @IBOutlet weak var mapView: UIImageView!
    var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView = UIScrollView()
        //设置代理
        scrollView.delegate = self
        scrollView.frame = self.view.bounds
        scrollView.contentSize = mapView.bounds.size
        scrollView.addSubview(mapView)
        self.view.addSubview(scrollView)
        
    }
    
    @IBAction func btnPressed(_ sender: Any) {
//        self.startJourneyButton.titleLabel?.text = "progress"
//        NSLog("pressed")
    }
}
