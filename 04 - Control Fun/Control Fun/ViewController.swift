//
//  ViewController.swift
//  Control Fun
//
//  Created by Kim Topley on 9/21/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, PlayerControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var startJourneyButton: UIButton!
    
    let audioController = PlayerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        sliderLabel.text = "50"
        audioController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func backgroundTap(_ sender: UIControl) {
//        nameField.resignFirstResponder()
//        numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
//        let progress = lroundf(sender.value)
//        sliderLabel.text = "\(progress)"
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
//        let setting = sender.isOn
//        leftSwitch.setOn(setting, animated: true)
//        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
////        if sender.selectedSegmentIndex == 0 {
////            leftSwitch.isHidden = false
////            rightSwitch.isHidden = false
////            doSomethingButton.isHidden = true
//        } else {
//            leftSwitch.isHidden = true
//            rightSwitch.isHidden = true
//            doSomethingButton.isHidden = false
//        }
    }
    
    // callback of button startJourney
    @IBAction func buttonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure, JvJv?",
                            message:nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",
                            style: .destructive, handler: { action in
                                self.performSegue(withIdentifier: "firstSegue", sender: self)
                                if !self.audioController.playing {
                                    self.audioController.play()
//                                    playLabel.text = NSLocalizedString("Stop", comment: "")
                                }
//            let msg = self.nameField.text!.isEmpty
//                    ? "You can breathe easy, everything went OK."
//                    : "You can breathe easy, \(self.nameField.text),"
//                      + " everything went OK."
//            let controller2 = UIAlertController(title:"Something Was Done",
//                                                message: msg, preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
//            controller2.addAction(cancelAction)
//            self.present(controller2, animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "nope really, wait a min!",
                            style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    func playbackBegan() {
//        playButton.isSelected = true
//        playLabel.text = NSLocalizedString("Stop", comment: "")
    }
    
    func playbackStopped() {
//        playButton.isSelected = false
//        playLabel.text = NSLocalizedString("Play", comment: "")
    }

}

