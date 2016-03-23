//
//  ViewController.swift
//  ShakeAndSwipe
//
//  Created by Fernando Augusto de Marins on 17/02/16.
//  Copyright © 2016 Fernando Augusto de Marins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var direction: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGesture(.Right)
        addGesture(.Left)
        addGesture(.Down)
        addGesture(.Up)
        
    }
    
    func swipe(gesture: UISwipeGestureRecognizer?) {
        
        if let swipeGesture = gesture {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                direction.text = "RIGHT!"
            case UISwipeGestureRecognizerDirection.Left:
                direction.text = "LEFT!"
            case UISwipeGestureRecognizerDirection.Up:
                direction.text = "UP!"
            case UISwipeGestureRecognizerDirection.Down:
                direction.text = "DOWN!"
            default:
                break
            }
        }
    }
    
    func addGesture(direction: UISwipeGestureRecognizerDirection) {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: "swipe:")
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            direction.text = "SHAKE!"
        }
    }

}