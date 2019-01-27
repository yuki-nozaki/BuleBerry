//
//  EventListViewCell.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2018/12/21.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

final class EventListViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    // placeも付ける（UILabelでおk）
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension EventListViewCell {
    
    func setup() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        addressLabel.numberOfLines = 0
        addressLabel.font = UIFont.systemFont(ofSize: 17)
        
        placeLabel.numberOfLines = 0
        placeLabel.font = UIFont.systemFont(ofSize: 16)
    }
}
