//
//  MakeCheckViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/10/29.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class MakeCheckViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height

    var checkListItem: [String: Bool] = [
        "アイテム1": true,
        "アイテム2": false,
        "アイテム3": true,
        "アイテム4": true,
        "アイテム5": false
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(
            x: 0,
            y: statusBarHeight,
            width: view.frame.width,
            height: view.frame.height - statusBarHeight)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let cellText = cell.textLabel?.text
            
            if cell.imageView?.image == UIImage(named: "checked") {
                
                checkListItem.updateValue(false, forKey: cellText!)
                cell.imageView?.image = UIImage(named: "unchecked")
            } else {
                
                checkListItem.updateValue(true, forKey: cellText!)
                cell.imageView?.image = UIImage(named: "checked")
            }
            
            cell.isSelected = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var keys = [String](checkListItem.keys)
        keys.sort()
        
        let cellText = keys[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = cellText
        
        if checkListItem[cellText]! {
            cell.imageView?.image = UIImage(named: "checked")
        } else {
            cell.imageView?.image = UIImage(named: "unchecked")
        }
        
        return cell
    }
}
