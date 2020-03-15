//
//  Singleton.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2019/04/15.
//  Copyright © 2019 野崎勇樹. All rights reserved.
//

import Foundation

protocol State {
    func morningGreet() -> String
    func coldGreet() -> String
}

class BadState: State {
    func morningGreet() -> String {
        return "おう"
    }
    
    func coldGreet() -> String {
        return "寒むっ"
    }
}

class OrdinaryState: State {
    func morningGreet() -> String {
        return "おはようございます"
    }
    
    func coldGreet() -> String {
        return "寒いね"
    }
}

class StateMan {
    private var state: State? = nil
    init(state: State) {
        self.state = state
    }
    
    func getMorningGreet() -> String {
        guard let state = self.state else {
            return ""
        }
        return state.morningGreet()
    }
    
    func getColdGreet() -> String {
        guard let state = self.state else {
            return ""
        }
        return state.coldGreet()
    }
}


//class SimpleData {
//    var title: String
//    var context: String
//
//    init(title: String, context: String) {
//        self.title = title
//        self.context = context
//    }
//}
//
//
//class Singleton: NSObject {
//    var data = SimpleData(title: "kamen", context: "いけいけどんどん")
//    static let sharedInstance = Singleton()
//    private override init() {
//    }
//}
