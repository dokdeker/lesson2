//
//  ViewController.swift
//  UIPanGestureRecognizer
//
//  Created by Евгений on 27.11.2020.
//

import UIKit
let label = UILabel()
let touchView = UIView()

class ViewController: UIViewController {
    
    private lazy var panGesureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewDidSlide(_:)))
    
    private var num:Int = 0
    private var firstTouchPosition = CGPoint ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLable()
        createTouchView()
        
    }

    func createLable() {
        label.textColor = .white
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 60.0)
        label.textAlignment = .center
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    func createTouchView() {
        touchView.backgroundColor = .white
        touchView.alpha = 0.05
        view.addSubview(touchView)
        
        touchView.layer.cornerRadius = 20
        touchView.translatesAutoresizingMaskIntoConstraints = false
        touchView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40).isActive = true
        touchView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        touchView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        touchView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        touchView.addGestureRecognizer(panGesureRecognizer)
    }

    
    @objc func viewDidSlide(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            firstTouchPosition = sender.translation(in: touchView)
            
            if firstTouchPosition.y < 0 {
                num += 1
                label.text = String(num)
            } else if firstTouchPosition.y > 0 && num != 0 {
                num -= 1
                label.text = String(num)
            }

        default: break
        }
    }
    
}

