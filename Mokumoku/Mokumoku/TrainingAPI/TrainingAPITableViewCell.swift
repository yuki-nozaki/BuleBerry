//
//  TrainingAPITableViewCell.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/12/14.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class TrainingAPITableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.textColor = .black
//        self.label.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func changeName(to text: String) {
        self.label.text = text
    }
}
