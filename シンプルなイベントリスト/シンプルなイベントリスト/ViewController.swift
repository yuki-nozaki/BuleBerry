//
//  ViewController.swift
//  シンプルなイベントリスト
//
//  Created by 野崎勇樹 on 2018/11/25.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    var items = ["first", "second", "third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ViewController {
    
    func setup() {
        let tableFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView = UITableView(frame: tableFrame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
