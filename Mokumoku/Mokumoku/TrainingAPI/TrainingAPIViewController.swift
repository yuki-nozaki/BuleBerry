//
//  TrainingAPIViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/12.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class TrainingAPIViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var articles: [[String: Any]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
//    fileprivate var name: [[String: Any]] = [] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    //TODO: collectionViewに置き換える
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        createData()
        useTableCell()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(iOS 11.0, *) {
            tableView.frame = CGRect(x: self.view.safeAreaInsets.left, y: self.view.safeAreaInsets.top, width: self.view.frame.width - (self.view.safeAreaInsets.left + self.view.safeAreaInsets.right), height: self.view.frame.height - (self.view.safeAreaInsets.top + self.view.safeAreaInsets.bottom))
        } else {
            tableView.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: view.frame.height)
        }
    }
    
    private func createData() {
        guard let url = URL(string: "http://qiita.com/api/v2/items") else {return}
//        guard let urlGrnavi = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=d27e539fbe13dd562fc22dfcf5b04acc&format=json&areacode_m=AREAM2178") else {return} //Dictionaryではなく、Array型にする必要がある
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            do {
                guard let data = data else {return}
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as Any
//                let rest = json["rest"] as AnyObject
//                let shopName = rest["name"]
//                let articles = json.map { article -> [String: Any]? in
//                    return article as? [String: Any]
//                }
//                DispatchQueue.main.async() {() -> Void in
//                    self.articles = articles
//                }
//                DispatchQueue.main.async() {() -> Void in
//                    self.name = [shopName as! [String : Any]]
//                }
                
                print("\(json)")
            }
            catch{
                print(error)
            }
        })
        task.resume()
    }
    
    private func useTableCell() {
        // customTableCellを作成
        tableView.register(UINib.init(nibName: "TrainingAPITableViewCell", bundle: Bundle.init(for: TrainingAPIViewController.self)), forCellReuseIdentifier: "TableCell")
    }
}

extension TrainingAPIViewController: UITableViewDataSource {
   
    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
//        return name.count
    }
    
    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrainingAPITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TrainingAPITableViewCell
        let article = self.articles[indexPath.row]
        let title = article["title"] as? String ?? ""
        cell.changeName(to: "title: \(title)")
//        cell.changeName(to: "section:\(indexPath.section) index:\(indexPath.row)")
//        let name = self.name[indexPath.row]
//        cell.changeName(to: "name: \(name)")
        return cell
    }
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension TrainingAPIViewController: UITableViewDelegate {
    
    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section:\(indexPath.section) index:\(indexPath.row)")
    }
    
    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}
