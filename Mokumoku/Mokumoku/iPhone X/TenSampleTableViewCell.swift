//
//  TenSampleTableViewCell.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/10/26.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class TenSampleTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(cell: TestCellThings) {
        label?.text = cell.name
        
    }
}
