//
//  CustomCell.swift
//  Table&Collection
//
//  Created by Евгений on 09.12.2020.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var cellButtonOutlet: UIButton!
    
    @IBOutlet weak var cellLabel: UILabel!
    

    
    
    
    func setup(cellText: String) {
        cellLabel.text = cellText
    }
    
}

