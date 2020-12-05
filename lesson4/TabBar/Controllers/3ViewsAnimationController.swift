//
//  3ViewsAnimationController.swift
//  TabBar
//
//  Created by Евгений on 06.12.2020.
//

import UIKit

class ThreeViewsControllerAnimation: UIViewController {
   
    @IBOutlet weak var ViewContainer: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondWiew: UIView!
    @IBOutlet weak var thirdWiew: UIView!
    @IBOutlet weak var leftConstView3: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeViewAnimation(tapGestureRecognizer:)))
        ViewContainer.isUserInteractionEnabled = true
        ViewContainer.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(changeViewColorAndConstraint(tapGestureRecognizer:)))
        thirdWiew.isUserInteractionEnabled = true
        thirdWiew.addGestureRecognizer(tapGestureRecognizer3)
    }
    
    private var isFlipped:Bool = true
    @objc func changeViewAnimation(tapGestureRecognizer: UITapGestureRecognizer)
    {
        UIView.transition(from: isFlipped ? firstView : secondWiew,
                          to: isFlipped ? secondWiew : firstView,
                          duration: 1.0,
                          options: [.curveEaseInOut, .transitionCurlUp, .showHideTransitionViews], completion: { _ in
                            self.isFlipped.toggle()
        })
    }
    
    
    
    private var colorView = UIColor()
    @objc func changeViewColorAndConstraint(tapGestureRecognizer: UITapGestureRecognizer)
    {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [self] in
            leftConstView3.constant = CGFloat(Int.random(in: 10...200))
            view.layoutIfNeeded()
            
            ViewText3.randomColorChange()
            thirdWiew.backgroundColor = randomColor
            
        }
    }

    
    
}
