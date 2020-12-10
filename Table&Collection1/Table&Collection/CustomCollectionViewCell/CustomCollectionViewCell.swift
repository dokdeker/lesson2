//
//  CustomCell.swift
//  Table&Collection
//
//  Created by Евгений on 09.12.2020.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    
    func setupCollectionCell(index:Int) {
        
        label.text = String(index) + emojiProduct
        //secLabel.text = costProduct
    }
    
}

