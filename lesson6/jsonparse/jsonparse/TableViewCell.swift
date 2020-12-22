//
//  SceneDelegate.swift
//  jsonparse
//
//  Created by Евгений on 22.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
  
  @IBOutlet weak var color: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var type: UILabel!
  @IBOutlet weak var hex: UILabel!
  @IBOutlet weak var rgba1: UILabel!
  @IBOutlet weak var rgba2: UILabel!
  @IBOutlet weak var rgba3: UILabel!
  @IBOutlet weak var rgba4: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
