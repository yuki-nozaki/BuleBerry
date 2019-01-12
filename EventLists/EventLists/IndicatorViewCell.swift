//
//  IndicatorViewCell.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2018/12/24.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

final class IndicatorViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
