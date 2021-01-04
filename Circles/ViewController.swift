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
    }

    @IBAction func panPurple(_ sender: UIPanGestureRecognizer) {
        move(sender)
        
        guard let senderView = sender.view else {
            return
        }
        let senderFrame = senderView.frame
        
        for view in arrayOfViews {
            let viewFrame = view.frame
            
            let viewX = viewFrame.minX
            let viewY = viewFrame.minY
            let viewWidth = viewFrame.width
            let viewHeight = viewFrame.height
        
            if senderFrame.intersects(viewFrame) {
                if senderView.isEqual(view) {
                    return
                }
            
                view.workingView.backgroundColor = .blue
                senderView.isHidden = true
                view.frame = CGRect(x: viewX, y: viewY, width: viewWidth + 10, height: viewHeight + 10)
            }
        }
    }
        
    func move(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.center = CGPoint(x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else {
            return
        }
    }
}

