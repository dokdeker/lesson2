//
//  ViewController.swift
//  TabBar
//
//  Created by Евгений on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


var textFromTF = String()

class ViewText1: UIViewController {
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBAction func buttonView1Action(_ sender: Any) {
        self.view.endEditing(true)
    }
    

    
    @IBAction func textFieldAction(_ sender: Any) {
        checkEmptyTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkEmptyTextField()
    }
    
    private func checkEmptyTextField() {
        if textFieldOutlet.text?.isEmpty == true {
            buttonOutlet.isEnabled = false
            buttonOutlet.backgroundColor = .gray
        } else {
            textFromTF = textFieldOutlet.text!
            buttonOutlet.isEnabled = true
            buttonOutlet.backgroundColor = .systemBlue
        }
    }


}



//--------------------------------------
var button = UIButton()
class ViewText2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    
    func createButton() {
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.setTitle("Анимировать текст", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonActionUp), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonActionDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonActionUpOut), for: .touchUpOutside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    @objc func buttonActionUp(sender: UIButton!) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            button.titleLabel?.alpha = 0.2
        }) { (completed) in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                button.titleLabel?.alpha = 1
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let controller = storyboard.instantiateViewController(identifier: "Page3")
            self.present(controller, animated: true)
            
        }
    }
    @objc func buttonActionDown(sender: UIButton!) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
            button.titleLabel?.alpha = 0.2
        }
    }
    @objc func buttonActionUpOut(sender: UIButton!) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
            button.titleLabel?.alpha = 1.0
        }
    }
}



//------------------------------------
var randomColor = UIColor()
var scaleLable:CGFloat = 15
class ViewText3: ViewController {
    @IBOutlet weak var Lable: UILabel!
    @IBAction func buttonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        Lable.text = textFromTF
        Lable.font = UIFont.boldSystemFont(ofSize: 15.0)
        animationLable()
    }
    
    @IBOutlet weak var constY: NSLayoutConstraint!
    
    func animationLable() {
        scaleLable = CGFloat.random(in: 1.8...2.8)
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [self] in
            ViewText3.randomColorChange()
            Lable.transform = CGAffineTransform(scaleX: scaleLable, y: scaleLable)
            Lable.textColor = randomColor
            constY.constant = -10
            view.layoutIfNeeded()
            
        }) { [self] (completed) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                animationLable2()
            })
        }
    }
    
    func animationLable2() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations: { [self] in
            ViewText3.randomColorChange()
            Lable.transform = CGAffineTransform(scaleX: (-scaleLable + 0.3), y: (scaleLable - 0.3))
            Lable.textColor = randomColor
            constY.constant = 20
            view.layoutIfNeeded()
            
        }) { [self] (completed) in
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [self] in
                
                Lable.transform = CGAffineTransform(scaleX: (scaleLable - 0.3), y: (scaleLable - 0.3))
                view.layoutIfNeeded()
                
            }) { [self] (completed) in
                
                animationLable()
                
            }

        }
    }
    
    
    
    static func randomColorChange() {
        let num: Int = Int.random(in: 1...8)
        switch num {
        case 1: randomColor = .systemBlue
        case 2: randomColor = .systemGreen
        case 3: randomColor = .lightGray
        case 4: randomColor = .systemRed
        case 5: randomColor = .systemPink
        case 6: randomColor = .systemOrange
        case 7: randomColor = .systemPurple
        case 8: randomColor = .systemTeal
        default: randomColor = .systemGray4
        }
    }
    
}
