//
//  Const.swift
//  weatherReport
//
//  Created by yokoyama.tatsuya on 2015/01/03.
//  Copyright (c) 2015年 yokoyama.tatsuya. All rights reserved.
//

import Foundation

// 定数クラスの作成にあたって↓を参照にしました
// http://hidef.jp/post-687/
//
class Const {
    // セクションの数
    class var tableSectionNum : Int {
        return 1
    }
    // 1セクションあたりのセルの行数
    class var tableCellNum : Int {
        return 10
    }
    // API取得先URL
    class var apiUrlString : String {
        return "http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo&APPID=b626bf9a4ce7e7e3dc9d3e87af42159b"
    }
    // 曜日
    class var allWeekDay : Array<String> {
        return ["-", "日", "月", "火" , "水", "木", "金", "土"]
    }
}

