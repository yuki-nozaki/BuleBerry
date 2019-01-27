//
//  EventRequester.swift
//  シンプルなイベントリスト
//
//  Created by 野崎勇樹 on 2018/11/25.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import Foundation
import UIKit

struct Event: Codable {
    var count: Int
    var limit: Int
    var events: [Events]
}

// TODO イベントタイトルに合うように修正
struct Events: Codable {
    var title: String
    var contents: String
    var address: String
    var place: String
    var url: String?
}

struct URLList: Codable {
    // 必要に応じて、パラメータを付加できる様にしたい（今は一つのパラメータを付与する様にしている　※&で括るとか）
    // 入力したキーワードで検索できるように修正する
    // どこの都道府県でやってるかどうか - 割り当てられたIDを利用する（あらかじめ、enumで持っておく）
    enum BaseUrl: String {
        case study = "https://eventon.jp/api/events.json?ymd_between="
        // https://eventon.jp/api/events.json?prefecture_id=8,9,10,11,12,13,14
        func getUrl() -> String {
            switch self {
            case .study:
                return self.rawValue
            }
        }
    }
}

final class EventRequester: NSObject {
    
    private let viewModel = ViewModel()
    private let currentDate = Date()
    private var urlString = URLList.BaseUrl.study.getUrl()
    
    static let shared = EventRequester()
    
    // どこかでパラメータを付与、プロパティに変更後のurlを反映させる必要がある
    // 日付パラメータの例：20180320,20180505
    func request(by date: Date, at country: String, completion: @escaping (Event) -> Void) {
        let nowDate = formatter(date: Date())
        let selectedDate = formatter(date: date)
        let yearAppendParam = "\(nowDate),\(selectedDate)"
        urlString.append(yearAppendParam)
//        var countryCode = 0
        if country != "" {
            guard let countryCodeInt = Int(country) else { return }
//            countryCode = countryCodeInt
//            let countryCodeUrl = "&prefecture_id=" + "\(countryCode)"
            let countryCodeUrl = "&prefecture_id=" + "\(countryCodeInt)"
            urlString.append(countryCodeUrl)
        }
        
        guard let requestUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: requestUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "リクエストエラー")
            }
            guard let data = data else { return }
            // dataをローカル環境に保存する
            
            do {
                let json = try JSONDecoder().decode(Event.self, from: data)
                // TODO ViewModelにjsonを渡すように修正
                // TODO レスポンスが空の場合、検索結果がなかったことを伝える
                completion(json)
                // TODO 追加リクエストはどうするべきか。。。
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func formatter(date: Date) -> String {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyyMMdd"
        return dateFomatter.string(from: date)
    }
}
