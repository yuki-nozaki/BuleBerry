//
//  ViewController.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2018/12/01.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // UIParts
    private var searchButton = UIButton()
    private var textField = UITextField()
    private var message = UILabel()
    
    // Property
    private var datePicker = UIDatePicker()
    private var dateFomatter = DateFormatter()
    private var searchDateParam = Date()
    private let requester = EventRequester()
    
    fileprivate var eventList: Event!
    
    // VC
    private var tableViewController = EventListViewController()

    // message
    private let clickMessage = "上記の日付で検索します"
    private let textPlaceMesage = "日付を入力してください"
    private let searchMessage = "検索します"
    
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
    
    func setup() {
        // textFieldの設定
        textField = UITextField(frame: CGRect(x: view.frame.width / 10, y: view.frame.height / 5, width: view.frame.width * 4 / 5, height: view.frame.height / 10))
        textField.placeholder = textPlaceMesage
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        textField.backgroundColor = .black
        // labelの設定
        message = UILabel(frame: CGRect(x: textField.frame.origin.x, y: view.frame.height * 3 / 10, width: textField.frame.width, height: textField.frame.height))
        message.text = clickMessage
        message.textColor = .white
        message.backgroundColor = .gray
        message.textAlignment = .center
        message.layer.masksToBounds = true
        message.layer.cornerRadius = 10
        // 検索ボタンの設定
        searchButton = UIButton(frame: CGRect(x: textField.frame.origin.x, y: view.frame.height / 2, width: textField.frame.width, height: textField.frame.height))
        searchButton.addTarget(self, action: #selector(onClickSearchButton), for: .touchUpInside)
        searchButton.setTitle(searchMessage, for: .normal)
        searchButton.backgroundColor = .red
        searchButton.tintColor = .blue
        
        view.addSubview(textField)
        view.addSubview(message)
        view.addSubview(searchButton)
        setDatePicker()
    }
    
    
    func setDatePicker() {
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
    
    @objc func done() {
        textField.endEditing(true)
        
        // 日付のフォーマット
        dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyyMMdd"
        textField.text = "\(dateFomatter.string(from: datePicker.date))"
        // リクエストするためのパラメータを保持させる
        searchDateParam = datePicker.date
    }
    
    @objc func onClickSearchButton() {
        //  画面を暗くする、リクエストが完了したことを伝える（タイマー？？？）
        tableViewController = EventListViewController.instantiate(date: searchDateParam)
        present(tableViewController, animated: true, completion: nil)
    }
}
