//
//  ViewController.swift
//  BuletoothSample
//
//  Created by 野崎勇樹 on 2017/12/25.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController,CBCentralManagerDelegate, CBPeripheralDelegate, UITextFieldDelegate{
    
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    var peripheralManager: CBPeripheralManager!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    //  接続状況が変わるたびに呼ばれる
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("state:\(central.state)")
    }
    
    @IBAction func scanButton(_ sender: Any) {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    //  スキャン結果を取得
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        self.peripheral = peripheral
        self.centralManager.connect(self.peripheral, options: nil)
    }
    
    @IBAction func stopScan(_ sender: Any) {
        centralManager.stopScan()
    }
    
    //  接続成功時に呼ばれる
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connect success!!")
    }
    
    //  接続失敗時に呼ばれる
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("Connect Failed...")
    }
    
//    //  ペリフェラルのStatusが変化した時に呼ばれる
//    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
//        print("peripheral state:\(peripheral.state)")
//    }
    
//    @IBAction func startAdvertise(_ sender: Any) {
//        let advertisementData = [CBAdvertisementDataLocalNameKey: "Test Device"]
//        peripheralManager.startAdvertising(advertisementData)
        
//        let serviceUUID = CBUUID(string: "0000")
//        let service = CBMutableService(type: serviceUUID, primary: true)
//        let charactericUUID = CBUUID(string: "0001")
//        let characteristic = CBMutableCharacteristic(type: charactericUUID, properties: CBCharacteristicProperties.read, value: nil, permissions: CBAttributePermissions.readable)
//        service.characteristics = [characteristic]
//        self.peripheralManager.add(service)
//    }
    
//    //  サービス追加結果の取得
//    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
//        if error != nil {
//            print("Service add Failed...")
//        }
//
//        print("Service add Success!!")
//    }
    
//    //  アドバタイズ開始処理の結果を取得
//    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
//        if let error = error {
//            print("***Advertising \(error)")
//        }
//
//        print("Advertising success")
//    }
    
//    @IBAction func stopAdvertisement(_ sender: Any) {
//        peripheralManager.stopAdvertising()
//    }
    
    @IBAction func getService(_ sender: Any) {
        self.peripheral.delegate = self
        self.peripheral.discoverServices(nil)
    }
    
    //  service検索結果取得
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {
            print("error")
            return
        }

        print("\(services.count)個のサービスを発見。\(services)")
        //  サービスを見つけたらすぐにキャラクタリスティックを取得
        for obj in services {
            peripheral.discoverCharacteristics(nil, for: obj)
        }
    }

    //  service検索結果取得
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            print("\(characteristics.count)個のキャラクタリスティックを発見。\(characteristics)")
        }
    }
}
