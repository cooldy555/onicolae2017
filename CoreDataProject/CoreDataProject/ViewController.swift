//
//  ViewController.swift
//  CoreDataProject
//
//  Created by octavian nic on 5/3/17.
//  Copyright © 2017 octavian nic. All rights reserved.
//

import UIKit
import onicolae2017

class ViewController: UIViewController {

//    var isBlinking = false
    let blinkingLabel = BlinkingLabel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        blinkingLabel.startBlinking()
//
//        // Setup the BlinkingLabel
//        blinkingLabel.text = "I blink!"
//        blinkingLabel.font = UIFont.systemFontOfSize(20)
//        view.addSubview(blinkingLabel)
//        blinkingLabel.startBlinking()
//        isBlinking = true
//        
//        // Create a UIButton to toggle the blinking
//        let toggleButton = UIButton(frame: CGRectMake(10, 60, 125, 30))
//        toggleButton.setTitle("Toggle Blinking", for: .Normal)
//        toggleButton.setTitleColor(UIColor.redColor(), for: .Normal)
//        toggleButton.addTarget(self, action: "toggleBlinking", for: .touchUpInside)
//        view.addSubview(toggleButton)
    }

//    func toggleBlinking() {
//        if (isBlinking) {
//            blinkingLabel.stopBlinking()
//        } else {
//            blinkingLabel.startBlinking()
//        }
//        isBlinking = !isBlinking
//    }
//    
}
