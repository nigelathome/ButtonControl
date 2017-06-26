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

    @IBOutlet weak var mapView: UIImageView!
    @IBOutlet weak var meetup: UIButton!
    @IBOutlet weak var birthday: UIButton!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView = UIScrollView()
        //设置代理
        scrollView.delegate = self
//        scrollView.frame = self.view.bounds
        scrollView.frame = CGRect(x: 0, y: 0, width: 375*2 - 80 , height: 667)
        scrollView.contentSize = mapView.bounds.size
//        scrollView.isDirectionalLockEnabled = true
//        scrollView.alwaysBounceHorizontal = true
        scrollView.addSubview(mapView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(meetup)
        scrollView.addSubview(birthday)
//        mapView.isHidden = true

        
//        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    @IBAction func btnPressed(_ sender: Any) {
//        self.startJourneyButton.titleLabel?.text = "progress"
//        NSLog("pressed")
    }
    private var _orientations = UIInterfaceOrientationMask.landscapeRight
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self._orientations }
        set { self._orientations = newValue }
    }
}
