//
//  ViewController.swift
//  IB
//
//  Created by Евгений on 27.11.2020.
//

import UIKit

@IBDesignable class PrimaryButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectTopAnchor = rect.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        rectTopAnchor.isActive = true
    }
    
    var rectTopAnchor = NSLayoutConstraint()
    
    @IBOutlet weak var rect: UIView!
    
    @IBOutlet weak var btnOutlet: PrimaryButton!
    
    @IBAction func btnTouch(_ sender: Any) {
        
        rectTopAnchor.constant += CGFloat(Int.random(in: 15...50))
        
        
        if rectTopAnchor.constant >= 200 {
            rect.backgroundColor = .green
            
            btnOutlet.backgroundColor = .gray
            btnOutlet.isEnabled = false
        }
        
    }
}


