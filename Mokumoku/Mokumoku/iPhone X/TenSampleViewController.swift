//
//  TenSampleViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/10/26.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class TenSampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.rowHeight = 50
        table.delegate = self
        table.dataSource = self
        table.register(TestCell.self, forCellReuseIdentifier: NSStringFromClass(TestCell.self))
        self.view.addSubview(table)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TestCell.self), for: indexPath) as! TestCell
        cell.name?.text = "仮面ライダー"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "紋章"
    }
}

class TestCell: UITableViewCell {
    var name: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name = UILabel(frame: CGRect.zero)
        name?.textAlignment = .left
        contentView.addSubview(name!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        name?.frame = CGRect(x: 110, y: 0, width: frame.width - 100, height: frame.height)
    }
}
