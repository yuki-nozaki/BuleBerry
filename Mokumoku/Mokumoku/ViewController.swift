//
//  ViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/10/21.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import Foundation

class MyClass {
    
    let ms: String
    let name: String?
    
//    init(ms: String = "hello") {
//        self.ms = ms
//        self.name = nil
//    }

    // 指定イニシャライザ
    init(ms: String = "hello", name: String) {
        self.ms = ms
        self.name = name
    }
    
    //
    convenience init(ms: String = "ハロー") {
        self.init(ms: ms, name: "匿名")
    }
    
    func hello() {
        var helloMas: String
        if let user = name {
            helloMas = user + "さん。" + ms
        } else {
            helloMas = ms
        }
        print(helloMas)
    }
}

class Circle {
    
    // Computed プロパティ
    var radius: Double = 10
    var ares: Double {
        get{
            return radius * radius * M_PI // radius に対する変更がなされる際に参照される
        }
        set(menseki){
            radius = sqrt(menseki/M_PI) // aresに対して変更がなされる（設定される）際に参照される
        }
    }
}

class LargeCircle {
    
    // Computed プロパティ（読み取り専用ー値を設定することはできない）
    var radius: Double = 20
    var ares: Double {
        get{
            return radius * radius * M_PI
        }
    }
}

class Player {
    
    var times = 0
    var level: Int {
        willSet {
            print("---------------")
            print("willSet \(newValue)")
        }
        didSet {
            if oldValue != level {
                times += 1
                print("\(times)回目の更新")
                print("\(oldValue)→\(level)")
            } else {
                print("No Change")
            }
        }
    }
    
    init() {
        level = 0
    }
}

class Car {
    
    static var count = 0
    
    var moving = false
    
    func start() {
        Car.count += 1
        moving = true
    }
    
    func stop() {
        if Car.count > 0 {
            Car.count -= 1
            moving = false
        }
    }
}

// Make Computerd Class Property
class MyNewClass {
    static var radian: Double = 0.0

    class var degree: Double {
        get {
            let dosu = radian * 90 / M_PI
            return dosu
        }
        set(dosu) {
            radian = dosu * M_PI/90
        }
    }
    
    class func message() -> String {
        return "hello!"
    }
}

class Game {
    private var point = 0.0
    private(set) var level = 0
    
    func getPoint(value: Double) {
        point += value
        level = Int(floor(point/3))
    }
}

class MasterPlayer {
    var name: String = ""
    
    func hello() {
        print("やあ、!" + name)
    }
}

extension MasterPlayer {
    var who: String {
        get {
            return who
        }
        set (value) {
            name = value
        }
    }
    
    func bye() {
        print("またな！" + name)
    }
}

protocol GameProtocol {
    var gamePoint: Int{ get }
    func hit()
    func miss()
}

class MainGame: GameProtocol {
    private var total = 0
    
    var gamePoint: Int{
        get{
            return total
        }
    }
    
    func hit() {
        total += 10
        print(total)
    }
    func miss() {
        total /= 2
        print("半減")
    }
}

// メインクラス
@available(iOS 11.0, *)
class ViewController: UIViewController {
    
    let who = "サクラ"
    var level: Int?

//    override func loadView() {
//        let view = View(frame: UIScreen.main.bounds)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.view = view
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playString()
        playArray()
        playDictionary()
        
        let str = NSLocalizedString("str", comment: "")
        print(str)
        
        playSet()
        
        tryOptional()
        
        trySecondOptional()
        level = 12
        trySecondOptional()
        
        let myo1 = MyClass()
        let myo2 = MyClass(ms: "こんにちは")
        let myo3 = MyClass(ms: "こんばんわ", name: "Mori")
        
        myo1.hello()
        myo2.hello()
        myo3.hello()
        
        
        let circle = Circle()
        print(circle.ares)
        print(circle.radius)
        
        circle.ares *= 2
        print(circle.ares)
        print(circle.radius)
        
        circle.radius = 30
        print(circle.ares)
        print(circle.radius)
        
        
        let largeCircle = LargeCircle()
        largeCircle.radius = 50
        print(largeCircle.ares)
        
//        largeCircle.ares *= 2 // aresは読み取り専用なので、怒られる
        
        let thePlayer = Player()
        thePlayer.level = 10
        thePlayer.level = 10
        thePlayer.level = 15
        
        tryProperty()
        tryStaticProperty()
        
        tryAccess()
        extClass()
        
        extenColor()
        
        playMainGame()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11.0, *) {
            print("self: \(self.view.safeAreaInsets)")
        } else {
            // Fallback on earlier versions
        }
//        print("sub: \((self.view as! View).subView.safeAreaInsets)")
//        print("grand: \((self.view as! View).grandSubView.safeAreaInsets)")
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
    
    func playSet() {
        var numSet:Set<Int> = []
        numSet.insert(3)
        numSet.insert(5)
        numSet.insert(7)
        print(numSet)
        
        var colorSet: Set = ["red", "green", "yellow", "black"]
        if let theColor = colorSet.remove("black") {
            print("\(theColor)を取り除きました")
        } else if colorSet.contains("red") {
            print("\("red")は含まれています")
        } else {
            print("No Delete")
        }
        print(colorSet)
        
        let numberSet: Set<Double> = [3.2, 4.9, 1.9, 0.2, 9.3, 5.2]
        for num in numberSet.sorted() {
            print(num, separator: "", terminator: "点,")
        }
        
        let gaimu: Set<String> = ["オレンジ", "イチゴ", "パイン", "スイカ"]
        let baron: Set<String> = ["バナナ","マンゴー","キウイ","スイカ"]
        let mix = gaimu.union(baron)
        print(mix)
        let otherMix = gaimu.intersection(baron)
        print(otherMix)
        let theOtherMix = gaimu.subtracting(baron)
        print(theOtherMix)
        let othersMix = gaimu.symmetricDifference(baron)
        print(othersMix)
        print(gaimu == baron)
        print(gaimu != baron)
        
        let aSet: Set<Int> = [1,4,7,2]
        let bSet: Set<Int> = [3,5,7,1]
        let cSet: Set<Int> = [1,4]
        if aSet.isDisjoint(with: bSet) {
            print("共通の値はなし")
        } else {
            print("共通の値がありました")
            print(aSet.intersection(bSet))
        }
        if cSet.isSubset(of: aSet) {
            print("cSetはaSetのサブセットです")
        } else {
            print("No")
        }
        if aSet.isSuperset(of: cSet) {
            print("aSetはcSetのスーパーセットです")
        } else {
            print("No")
        }
    }
    
    // オプショナルについての学習用メソッド
    func tryOptional() {
        var msg: String? = "Hello"
        let newMsg = msg! + "World"
        print(newMsg)
        
        var count: Int?
        var price: Int
        
        price = 250 * (count ?? 2)
        print(price)
        
        count = 3
        price = 250 * (count ?? 2)
        print(price)
        
        var sum = 0
        let dic: [String: Int?] = ["a":23, "b":nil, "c":10, "d":nil]
        for (_, value) in dic {
            if let num = value {
                sum += num
            }
        }
        print("数値の合計は\(sum)")
        
        var str: String? = "★☆"
        var repqatingStr = ""
        var i = 0
        while let stamp = str {
            repqatingStr += stamp
            i += 1
            if i >= 10 {
                break
            }
        }
        print(repqatingStr)
        
        var balls: [(size: Int, color: String)] = []
        var ballSize = balls.first?.size
        print(ballSize)
        
        balls = [(size: 2, color: "red"), (size: 4, color: "black")]
        ballSize = balls.first?.size
        print(ballSize)
        if let exSize = ballSize {
            print(exSize)
        }
    }
    
    func trySecondOptional(){
        guard let theLevel = level else { return }
        if theLevel < 10 {
            print("hello、" + who + "隊員")
        } else {
            print("hello、" + who + "上級隊員")
        }
    }
    
    func tryProperty() {
        let car1 = Car()
        let car2 = Car()
        
        print(Car.count)
        car1.start()
        car2.start()
        print(Car.count)
        car2.stop()
        print(Car.count)
    }
    
    func tryStaticProperty() {
        MyNewClass.degree = 18
        let katamuki = MyNewClass.degree
        print("\(katamuki)")
        
        MyNewClass.radian = M_PI_2
        let katamuki2 = MyNewClass.degree
        print("\(katamuki2)")
        
        print(MyNewClass.message())
    }
    
    func tryAccess() {
        let player1 = Game()
        let player2 = Game()
        
        player1.getPoint(value: 5)
        player2.getPoint(value: 7)
        
        print(player1.level)
        print(player2.level)
    }
    
    func extClass() {
        let obj = MasterPlayer()
        obj.who = "wollet"
        obj.hello()
        obj.bye()
    }
    
    func extenColor() {
        let color1 = UIColor.red
        
        let color2 = UIColor.wakakusa
        let color3 = UIColor.beniaka
        
        view.backgroundColor = color3
        print(color1)
        print(color2)
        print(color3)
    }
    
    func playMainGame() {
        let game1 = MainGame()
        game1.hit()
        print(game1.gamePoint)
        
        game1.miss()
        print(game1.gamePoint)
        game1.hit()
        print(game1.gamePoint)
    }
}

// ?:プロトコルとstaticの違いは？

extension UIColor {
    class var wakakusa: UIColor {
        return UIColor(red: 0.67061, green: 0.7882, blue: 0.0, alpha: 1)
    }
    
    class var beniaka: UIColor {
        return UIColor(red: 0.898, green: 0.0, blue: 0.3098, alpha: 1)
    }
}
