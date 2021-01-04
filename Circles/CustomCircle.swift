//
//  CustomCircle.swift
//  Circles
//
//

import UIKit

@IBDesignable class CustomCircle: UIView {
    
    @IBOutlet var workingView: UIView!
    
    var xibName: String = "CustomCircle"
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        workingView = getFromXib()
        
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.layer.cornerRadius = frame.size.width / 2
        workingView.backgroundColor = .systemBlue
        
        addSubview(workingView)
    }

}
