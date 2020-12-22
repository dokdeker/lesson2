//
//  choosedImage.swift
//  photo
//
//  Created by Евгений on 22.12.2020.
//

import UIKit

class ChoosedImage: UIViewController {
    @IBOutlet weak var choosedImageOutlet: UIImageView!
    
 
    var newImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        choosedImageOutlet.image = newImage
        
    }
    

}



