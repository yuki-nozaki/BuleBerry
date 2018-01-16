//
//  ExWhetherTableViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/08.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class ExWhetherTableViewController: UITableViewController {

    var urlString = "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=ac8febbabfdd2ab10f7d0c907d688663&format=json"
    var items = NSMutableArray()
    var cellNum = 10
    var selectedInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNum
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if items.count > 0 {
            cell.textLabel?.text = items[indexPath.row] as? String
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        selectedInfo = items[indexPath.row] as? String
        performSegue(withIdentifier: "whether", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whether"{
            let viewController = segue.destination as! ExWhetherViewController
            viewController.info = selectedInfo
        }
    }
    
    func makeTableData() {
        let url = NSURL(string: self.urlString)!
        let task = URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
//            let json = JSON(data: data!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                // 各セルに情報を突っ込む
//                for i in 0..<self.cellNum {
//                    let dt_txt = json["list"][i]["dt_txt"]
//                    let weatherMain = json["list"][i]["weather"][0]["main"]
//                    let weatherDescription = json["list"][i]["weather"][0]["description"]
//                    let info = "\(dt_txt), \(weatherMain), \(weatherDescription)"
//                    print(info)
//                    self.cellItems[i] = info
//                }
            } catch {
                fatalError()
            }
            self.tableView.reloadData()
        })
        task.resume()
//        let url = URL(string: urlString)
//        guard let urlString = url else { return }
//        let task = URLSession.shared.dataTask(with: urlString, completionHandler: {data, response, error in
//            do {
//                let json = try JSONSerialization.data(withJSONObject: data, options: nil)
//            }
//            for (var i = 0; i < cellNum; i++) {
//
//
//            }
//        })
    }
}
