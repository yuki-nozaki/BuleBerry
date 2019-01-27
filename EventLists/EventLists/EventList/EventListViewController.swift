//
//  EventListViewController.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2018/12/09.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

final class EventListViewController: UIViewController {
    
    fileprivate var tableView: UITableView!
    private var returnButton: UIButton!
    private var date = Date()
    private var countryCode = ""
    private var webView = WKWebView()
    
    private var indicatorBackgroundView: UIView!
    private var indicatorView = UIActivityIndicatorView()
    
    fileprivate let noUrlAlertTitle = "リンク先が見つかりません"
    fileprivate let noEventListTitle = "検索結果が見つかりませんでした"
    fileprivate let okActionTitle = "OK"
    
    private let viewModel = ViewModel()
    private let eventRequester = EventRequester()
    
    fileprivate var eventList: Event!
    fileprivate var scrollBeginingPoint: CGPoint!
    
    // message
    private let buttonTitle = "検索画面に戻る"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        indicatorView.stopAnimating()
        indicatorBackgroundView.removeFromSuperview()
    }
    // TODO リクエストパラメータを付加する口を増やす　パラメータの塊を渡して、自由にリクエストできる様にする
    static func instantiate(date: Date, countryCode: String) -> EventListViewController {
        let vc = EventListViewController()
        vc.date = date
        vc.countryCode = countryCode
        return vc
    }
}

extension EventListViewController {
    
    fileprivate func setup() {
        // set table
        let tableFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 4 / 5)
        tableView = UITableView(frame: tableFrame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EventListViewCell", bundle: nil), forCellReuseIdentifier: "eventCell")
        self.view.addSubview(tableView)
        
        // set Button
        let buttonFrame = CGRect(x: 0, y: tableFrame.size.height, width: self.view.frame.width, height: self.view.frame.height / 5)
        returnButton = UIButton(frame: buttonFrame)
        returnButton.setTitle(buttonTitle, for: .normal)
        returnButton.addTarget(self, action: #selector(onClickReturnButton), for: .touchUpInside)
        self.view.addSubview(returnButton)
        
        // set WebView
        let webFrame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height * 2 / 3)
        webView = WKWebView(frame: webFrame)
        // TODO VMでリストの取得を行うようにする（通信メソッドなので）
        EventRequester.shared.request(by: date, at: countryCode, completion: { (event) in
            // VCで保持しているeventListにRequesterが拾ってきたeventを渡すように、クロージャで記載
            if event.count > 0 {
                self.eventList = event
            } else {
                let alert = UIAlertController(title: self.noEventListTitle, message: nil, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: self.okActionTitle, style: .default, handler:  { (action: UIAlertAction!) -> Void in
                    self.dismiss(animated: true, completion: nil)
                })
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        //        viewModel.getEventList(eventList: eventList, tableView: tableView)
    }
    
    fileprivate func getEventUrl(at number: Int) -> String? {
        guard let list = eventList else { return nil }
        return list.events[number].url
    }
    
    fileprivate func setupBackground() {
        DispatchQueue.main.async {
            // setup indicatorBackgroundView
            self.indicatorBackgroundView = UIView(frame: self.view.bounds)
            self.indicatorBackgroundView.backgroundColor = .black
            self.indicatorBackgroundView.alpha = 0.4
        
            // setup indicatorView
            self.indicatorView.style = .whiteLarge
            self.indicatorView.center = self.view.center
            self.indicatorView.color = .white
            self.indicatorView.hidesWhenStopped = true
        
            self.indicatorBackgroundView.addSubview(self.indicatorView)
            self.view.addSubview(self.indicatorBackgroundView)
        
            self.indicatorView.startAnimating()
        }
    }
    
    @objc fileprivate func onClickReturnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension EventListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Urlがあれば、WebViewで開くように
        tableView.reloadData()
        if let urlText = getEventUrl(at: indexPath.row), urlText != "" {
            guard let url = URL(string: urlText) else { return }
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: noUrlAlertTitle, message: nil, preferredStyle: .actionSheet)
            let alertAction = UIAlertAction(title: okActionTitle, style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
        
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableView = scrollView as? UITableView
        scrollBeginingPoint = tableView.contentOffset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView = scrollView as? UITableView
        let currentPoint = tableView.contentOffset
        if let scrollBeginingPoint = scrollBeginingPoint {
            if (scrollBeginingPoint.y < currentPoint.y) {
                print("下へスクロール")
                // TODO 追加リクエストを送るように修正
                
            } else {
                print("上へスクロール")
            }
        }
    }
}

extension EventListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let list = eventList else { return 100 } // 100件は出るようにする
        return list.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventListViewCell
        guard let list = eventList else { return cell }
        // setting Cell
        cell.titleLabel.text = list.events[indexPath.row].title
        cell.addressLabel.text = list.events[indexPath.row].address
        cell.placeLabel.text = list.events[indexPath.row].place
        
        // 表示の完了していないCellに関しては、indicatorを表示するようにする
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
