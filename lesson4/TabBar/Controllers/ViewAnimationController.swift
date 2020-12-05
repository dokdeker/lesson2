//
//  viewAnimationController.swift
//  TabBar
//
//  Created by Евгений on 04.12.2020.
//

import UIKit

class ViewControllerAnimation: UIViewController {

    @IBOutlet weak var ViewOutlet: UIView!
    @IBOutlet weak var constYView: NSLayoutConstraint!
    @IBOutlet weak var constXView: NSLayoutConstraint!
    
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBAction func buttonStartAnimation(_ sender: Any) {
        firstStepAnimation()
        buttonOutlet.isEnabled = false
        buttonOutlet.backgroundColor = .gray
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func firstStepAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [self] in
            
            animationViewPattern(scaleX: 0.8, scaleY: 0.8,
                                 height: 100, weight: 50,
                                 rotation: .pi/2,
                                 cornerRadius: 10,
                                 constraintX: 100, constraintY: 100,
                                 color: .systemBlue)
            
        }) { [self] (completed) in
            secondStepAnimation()
        }
    }
    
    func secondStepAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [self] in
            
            animationViewPattern(scaleX: -1.2, scaleY: 1.2,
                                 height: 40, weight: 120,
                                 rotation: .pi/2,
                                 cornerRadius: 20,
                                 constraintX: 50, constraintY: -50,
                                 color: .systemRed)
            
        }) { [self] (completed) in
            thirdStepAnimation()
        }
    }
    
    func thirdStepAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [self] in
            
            animationViewPattern(height: 90, weight: 90,
                                 cornerRadius: 45,
                                 constraintX: -50,
                                 color: .systemPurple)
            
            
        }) { [self] (completed) in
            initialParametersAnimation()
        }
    }
    
    func initialParametersAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [self] in
            
            animationViewPattern()
            
        }) { [self] (completed) in
            buttonOutlet.isEnabled = true
            buttonOutlet.backgroundColor = .systemBlue
        }
    }
    
    
    
    
    
    
    func animationViewPattern(scaleX: CGFloat = 1.0, scaleY: CGFloat  = 1.0,
                              height: CGFloat = 140, weight: CGFloat = 140,
                              rotation: CGFloat = .pi,
                              cornerRadius: CGFloat = 0,
                              constraintX: CGFloat = 0, constraintY: CGFloat = 0,
                              color: UIColor = .systemGreen) {
        
        ViewOutlet.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        viewHeight.constant = height
        viewWidth.constant = weight
        ViewOutlet.transform = CGAffineTransform(rotationAngle: rotation)
        ViewOutlet.layer.cornerRadius = cornerRadius
        constYView.constant = constraintX
        constXView.constant = constraintY
        ViewOutlet.backgroundColor = color
        view.layoutIfNeeded()
    }
    
    
}
