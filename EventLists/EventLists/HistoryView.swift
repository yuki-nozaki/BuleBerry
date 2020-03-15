//
//  HistoryView.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2019/02/10.
//  Copyright © 2019年 野崎勇樹. All rights reserved.
//

import UIKit

final class HistoryView: UIView {
    // UIParts
    private var tableView: UITableView! //カスタムTableViewを作成した方がいいかも
    private var titlelabel = UILabel()
    private var returnButton = UIButton()
    
    private var titleText = "履歴"
    private var returnButtonTitle = "戻る"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryView {
    
    fileprivate func setup() {
        // setup title
        titlelabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 10))
        titlelabel.text = titleText
        titlelabel.font = UIFont.systemFont(ofSize: 22)
        titlelabel.backgroundColor = .black
        titlelabel.textColor = .white
        titlelabel.textAlignment = .center
        
        // setup tableView(履歴を載せる)
        tableView = UITableView(frame: CGRect(x: 0, y: titlelabel.frame.height, width: self.frame.width, height: self.frame.height * 4 / 5))
        
        // setup button
        returnButton = UIButton(frame: CGRect(x: 0, y: titlelabel.frame.height + tableView.frame.height, width: self.frame.width, height: self.frame.height / 10))
        returnButton.setTitle(returnButtonTitle, for: .normal)
        returnButton.setTitleColor(.white, for: .normal)
        returnButton.backgroundColor = .black
        returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        returnButton.addTarget(self, action: #selector(onClickReturnButton), for: .touchUpInside)
        
        addSubview(titlelabel)
        addSubview(tableView)
        addSubview(returnButton)
    }
    
    @objc fileprivate func onClickReturnButton() {
        removeFromSuperview()
    }
}
