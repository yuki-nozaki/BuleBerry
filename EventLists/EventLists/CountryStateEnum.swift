//
//  CountryStateEnum.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2019/01/12.
//  Copyright © 2019年 野崎勇樹. All rights reserved.
//

enum CountryStateEnum: String, CaseIterable {
    case defalut = ""
    case hokkaido = "北海道"
    case aomori = "青森県"
    case iwate = "岩手県"
    case miyagi = "宮城県"
    case akita = "秋田県"
    case yamagata = "山形県"
    case hukushima = "福島県"
    case ibaragi = "茨城県"
    case tochigi = "栃木県"
    case gunma = "群馬県"
    case saitama = "埼玉県"
    case chiba = "千葉県"
    case tokyo = "東京都"
    case kanagawa = "神奈川県"
    case niigata = "新潟県"
    case toyama = "富山県"
    case ishikawa = "石川県"
    case hukui = "福井県"
    case yamanashi = "山梨県"
    case nagano = "長野県"
    case gihu = "岐阜県"
    case shizuoka = "静岡県"
    case aichi = "愛知県"
    case mie = "三重県"
    case shiga = "滋賀県"
    case kyoto = "京都府"
    case osaka = "大阪府"
    case hyogo = "兵庫県"
    case nara = "奈良県"
    case wakayama = "和歌山県"
    case totori = "鳥取県"
    case shimane = "島根県"
    case okayama = "岡山県"
    case hiroshima = "広島県"
    case yamaguchi = "山口県"
    case tokushima = "徳島県"
    case kagawa = "香川県"
    case ehime = "愛媛県"
    case kochi = "高知県"
    case hukuoka = "福岡県"
    case saga = "佐賀県"
    case nagasaki = "長崎県"
    case kumamoto = "熊本県"
    case ooita = "大分県"
    case miyazaki = "宮崎県"
    case kagoshima = "鹿児島県"
    case okinawa = "沖縄県"
    
    // リクエストに必要なcountryCodeを返す
    var countryCode: String {
        switch self {
        case .defalut:
            return ""
        case .hokkaido:
            return "1"
        case .aomori:
            return "2"
        case .iwate:
            return "3"
        case .miyagi:
            return "4"
        case .akita:
            return "5"
        case .yamagata:
            return "6"
        case .hukushima:
            return "7"
        case .ibaragi:
            return "8"
        case .tochigi:
            return "9"
        case .gunma:
            return "10"
        case .saitama:
            return "11"
        case .chiba:
            return "12"
        case .tokyo:
            return "13"
        case .kanagawa:
            return "14"
        case .niigata:
            return "15"
        case .toyama:
            return "16"
        case .ishikawa:
            return "17"
        case .hukui:
            return "18"
        case .yamanashi:
            return "19"
        case .nagano:
            return "20"
        case .gihu:
            return "21"
        case .shizuoka:
            return "22"
        case .aichi:
            return "23"
        case .mie:
            return "24"
        case .shiga:
            return "25"
        case .kyoto:
            return "26"
        case .osaka:
            return "27"
        case .hyogo:
            return "28"
        case .nara:
            return "29"
        case .wakayama:
            return "30"
        case .totori:
            return "31"
        case .shimane:
            return "32"
        case .okayama:
            return "33"
        case .hiroshima:
            return "34"
        case .yamaguchi:
            return "35"
        case .tokushima:
            return "36"
        case .kagawa:
            return "37"
        case .ehime:
            return "38"
        case .kochi:
            return "39"
        case .hukuoka:
            return "40"
        case .saga:
            return "41"
        case .nagasaki:
            return "42"
        case .kumamoto:
            return "43"
        case .ooita:
            return "44"
        case .miyazaki:
            return "45"
        case .kagoshima:
            return "46"
        case .okinawa:
            return "47"
        }
    }
}
