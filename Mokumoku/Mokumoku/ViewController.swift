//
//  ViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/10/21.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class ViewController: UIViewController {
    
    override func loadView() {
        let view = View(frame: UIScreen.main.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playString()
        playArray()
        playDictionary()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11.0, *) {
            print("self: \(self.view.safeAreaInsets)")
        } else {
            // Fallback on earlier versions
        }
        print("sub: \((self.view as! View).subView.safeAreaInsets)")
        print("grand: \((self.view as! View).grandSubView.safeAreaInsets)")
    }
    
    func message(user: String, msgFunc:(String) -> String) -> String {
        let msg = msgFunc(user)
        return msg
    }
    
    func hello(user: String) -> String {
        return ("\(user)さん、ハロー")
    }
    
    func bye(user: String) -> String {
        return ("\(user)さん、さよなら")
    }
    
    func price(age: Int) -> (Int) -> Int {
        if age < 16{
            return kids
        } else {
            return adult
        }
    }
    
    func kids(kazu: Int) -> Int {
        return 400 * kazu
    }
    
    func adult(kazu: Int) -> Int {
        return 600 * kazu
    }
    
    func playString() {
        let str = "Swift3"
        var start = str.startIndex
        start = str.index(after: start)
        let char = str[start]
        print(char)
        
        let index1 = str.index(str.startIndex, offsetBy: 3)
        let index2 = str.index(str.endIndex, offsetBy: -4)
        let str1 = str[index1...]
        print(str1)
        
        let index3 = str[str.index(str.startIndex, offsetBy: 1)...str.index(str.index(str.startIndex, offsetBy: 1), offsetBy: 2)]
        print(index3)
        
        
        let itemList = ["仮面ライダー","仮面","ライダー","仮面ライダーアギト"]
        var item1 = [String]()
        var item2 = [String]()
        for item in itemList {
            if item.hasPrefix("仮面") {
                item1.append(item)
            }
            if item.hasSuffix("ライダー") {
                item2.append(item)
            }
        }
        
        print(item1)
        print(item2)
    }
    
    func playArray() {
        var idArray = ["1","2","3"]
        
        let zeroList = [Double](repeating: 0.0, count: 10)
        print(zeroList)
        
        let numbers = [Int](-3...3)
        print(numbers)
        
        let alphabet = ["a","b","c","d","e","f"]
        let al1 = alphabet[1]
        let alArray = alphabet[2...4]
        print(al1)
        print(alArray)
        
        let numArray = [39, 21, 67, 96, 30]
        var sum = 0
        var min = Int.max
        var max = Int.min
        for item in numArray {
            sum += item
            if item < min {
                min = item
            } else if item > max {
                max = item
            }
        }
        let ave = Double(sum)/Double(numArray.count)
        print("合計:\(sum)平均:\(ave)最小:\(min)最大:\(max)")
        
        var numSort = [59, 76, 21, 96, 65]
        numSort.sort()
        print(numSort)
        let sortedNumArray = numArray.sorted()
        print(sortedNumArray)
    }
    
    func playDictionary() {
        var members = ["東京":15 ,"大阪":12, "京都":20]
        let toValue = members["東京"]
        let osValue = members["大阪"]
        print(toValue, osValue)
        let toosValue = toValue! + osValue!
        print(toosValue)
        print(members["京都"]!)
        
        let tokyoMetro = ["G":"銀座線", "M":"丸ノ内線", "H":"日比谷線", "T":"東西線", "C":"千代田線", "Z":"半蔵門線", "N":"南北線", "F":"副都心線"]
        for line in tokyoMetro {
            print(line)
        }
        
        var membersNew = ["東京":15 ,"大阪":12, "京都":20]
        membersNew["沖縄"] = 14
        membersNew["大阪"] = nil
        print(membersNew)
        
    }
}

