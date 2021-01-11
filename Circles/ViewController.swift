//
//  ViewController.swift
//  Circles
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewOne: CustomCircle!
    @IBOutlet weak var viewTwo: CustomCircle!
    @IBOutlet weak var viewThree: CustomCircle!
    @IBOutlet weak var viewFour: CustomCircle!
    @IBOutlet weak var viewFive: CustomCircle!
    @IBOutlet weak var viewSix: CustomCircle!
    @IBOutlet weak var viewSeven: CustomCircle!
    
    var arrayOfViews = [CustomCircle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfViews = [
            viewOne,
            viewTwo,
            viewThree,
            viewFour,
            viewFive,
            viewSix,
            viewSeven
        ]
        
        for view in arrayOfViews {
            view.workingView.backgroundColor = randomBlueColor()
        }
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        move(sender)
    }
    
    func move(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else {
            return
        }
        
        if gesture.state == .changed {
            gestureView.center = CGPoint(x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
            gesture.setTranslation(.zero, in: view)
        }
        
        if gesture.state == .ended {
            animate(gestureView)
        }
    }
    
    func animate(_ gestureView: UIView) {
        let senderFrame = gestureView.frame
        
        for view in arrayOfViews {
            let viewFrame = view.frame
            
            if senderFrame.intersects(viewFrame) {
                if gestureView.isEqual(view) {
                    return
                }
                
                UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeLinear, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                        gestureView.isHidden = true
                        view.transform = view.transform.scaledBy (x: 1.2, y: 1.2)
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5) {
                        view.workingView.backgroundColor = self.randomBlueColor()
                    }
                })
            }
        }
    }
    
    func randomBlueColor() -> UIColor {
        return UIColor(red: 0,
                       green: .random(in: 0...1),
                       blue: 1,
                       alpha: .random(in: 0.5...1))
    }
}


