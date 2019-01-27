//
//  ViewController.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2018/12/01.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    // UIParts
    private var searchButton = UIButton()
    private var textField = UITextField()
    private var message = UILabel()
    private var picker = UIPickerView()
    private var playBackButton = UIButton()
    
    // Property
    private var datePicker = UIDatePicker()
    private var dateFomatter = DateFormatter()
    private var searchDateParam = Date()
    private var searchCountryCode = ""
    
    fileprivate var eventList: Event!
    
    // VC
    private var tableViewController = EventListViewController()

    // message
    private let clickMessage = "上記の日付で検索します"
    private let textPlaceMesage = "日付を入力してください"
    private let searchMessage = "検索します"
    private let gifMessage = "gifを再生"
    
    // 日時を設定するためのボタンと遷移及びリクエストするためのボタンを配置する（できれば戻るボタンも）を配置
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        textField.text = ""
    }
}

extension ViewController {
    
    fileprivate func setup() {
        // textFieldの設定
        textField = UITextField(frame: CGRect(x: view.frame.width / 10, y: view.frame.height / 5, width: view.frame.width * 2 / 5, height: view.frame.height / 10))
        textField.placeholder = textPlaceMesage
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        textField.backgroundColor = .black
        textField.clearButtonMode = .always
        // 都道府県Pickerの設定
        picker = UIPickerView(frame: CGRect(x: view.frame.width / 2, y: textField.frame.origin.y, width: textField.frame.width, height: textField.frame.height))
        picker.delegate = self
        picker.dataSource = self
        // labelの設定
        message = UILabel(frame: CGRect(x: textField.frame.origin.x, y: view.frame.height * 3 / 10, width: view.frame.width * 4 / 5, height: textField.frame.height))
        message.text = clickMessage
        message.textColor = .white
        message.backgroundColor = .gray
        message.textAlignment = .center
        message.layer.masksToBounds = true
        message.layer.cornerRadius = 10
        // 検索ボタンの設定
        searchButton = UIButton(frame: CGRect(x: textField.frame.origin.x, y: view.frame.height / 2, width: message.frame.width, height: textField.frame.height))
        searchButton.addTarget(self, action: #selector(onClickSearchButton), for: .touchUpInside)
        searchButton.setTitle(searchMessage, for: .normal)
        searchButton.backgroundColor = .red
        searchButton.tintColor = .blue
        
        // GIF再生ボタンの設定
        playBackButton = UIButton(frame: CGRect(x: textField.frame.origin.x, y: message.frame.origin.y + message.frame.height, width: message.frame.width, height: textField.frame.height))
        playBackButton.addTarget(self, action: #selector(onClickGifButton), for: .touchUpInside)
        playBackButton.setTitle(gifMessage, for: .normal)
        playBackButton.backgroundColor = .green

        
        view.addSubview(textField)
        view.addSubview(picker)
        view.addSubview(message)
        view.addSubview(searchButton)
        // GIF再生確認用 - 必要な時にコメントアウト外す
//        view.addSubview(playBackButton)
        setDatePicker()
    }
    
    
    fileprivate func setDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja_JP")
        datePicker.minimumDate = Date()
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)

        textField.inputView = datePicker
        textField.inputAccessoryView = toolbar
    }
    
    @objc fileprivate func done() {
        textField.endEditing(true)
        
        // 日付のフォーマット
        dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyyMMdd"
        textField.text = "\(dateFomatter.string(from: datePicker.date))"
        // リクエストするためのパラメータを保持させる
        searchDateParam = datePicker.date
    }
    
    @objc func onClickSearchButton() {
        tableViewController = EventListViewController.instantiate(date: searchDateParam, countryCode: searchCountryCode)
        present(tableViewController, animated: true, completion: nil)
    }
    
    @objc func onClickGifButton() {
        let vc = GIFViewController()
        present(vc, animated: true, completion: nil)
    }
}

// UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CountryStateEnum.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        searchCountryCode = CountryStateEnum.allCases[row].countryCode
    }
}

// UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CountryStateEnum.allCases.count
    }

}
