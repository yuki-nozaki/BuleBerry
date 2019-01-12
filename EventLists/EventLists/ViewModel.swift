
//
//  ViewModel.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2018/12/01.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import Foundation
import UIKit

final class ViewModel {
    
    var event: Event!
    
    // TODO 非通信時でもリストを表示できるように、起動時に取得するようにする。
    // 取得したリストをローカルに保存する（json形式）
//    func getEventList(eventList: Event, tableView: UITableView) {
//        var list = eventList
//        EventRequester.shared.request(by: Date(), completion: { (event) in
//            list = event
//            DispatchQueue.main.async {
//                tableView.reloadData()
//            }
//        })
//    }
}
