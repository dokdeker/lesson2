//
//  ViewController.swift
//  Table&Collection
//
//  Created by Евгений on 09.12.2020.
//

import UIKit

var array: [String] = ["Apple", "Lemon", "Orange", "Chocolate", "Milk", "oo", "11", "22", "33", "oo", "11", "22", "33", "oo", "11", "22", "33", "oo", "11", "22", "33", "oo", "11", "22", "33"]



class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headLableNC: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        
    }

    func aboutCell() {
        performSegue(withIdentifier: "aboutCell", sender: nil)
    }

}









extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    
        cell.setup(cellText: array[indexPath.row])
        
        cell.cellButtonOutlet.addTarget(self, action: #selector(buttonActionUp), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonActionUp(sender: UIButton){
        aboutCell()
    }
}


var emojiProduct: String = ""

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //headLabel.text = array[indexPath.row]
        headLableNC.title = array[indexPath.row]
        
        switch array[indexPath.row] {
        
        case array[0]:
            emojiProduct = "🍏"
        case array[1]:
            emojiProduct = "🍋"
        case array[2]:
            emojiProduct = "🍊"
        case array[3]:
            emojiProduct = "🍫"
        case array[4]:
            emojiProduct = "🥛"
        default:
            emojiProduct = "🗿❔"
        }
    }
}


