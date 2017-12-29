//
//  Buletooth.swift
//  BuletoothSample
//
//  Created by 野崎勇樹 on 2017/12/29.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import CoreBluetooth

class Buletooth: NSObject, CBCentralManagerDelegate {

    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("power Off!")
            break
        case .poweredOn:
            print("power On!")
            self.centralManager.scanForPeripherals(withServices: nil, options: nil)
            break
        case .resetting:
            print("Resseting!")
            break
        case .unauthorized:
            print("Central State: Unauthorized.")
            break
        case .unknown:
            print("Central State: Unknown.")
            break
        case .unsupported:
            print("Central State: Unsupported.")
            break
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("\(peripheral)")
        for ad in advertisementData {
            print("\(ad)")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Delegate: didDisconnectPeripheral.")
        print("Peripheral: \(peripheral)")
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Delegate: didConnect.")
        print("Peripheral: \(peripheral)")
        if let service = peripheral.services {
            for src in service {
                print("Service: \(src)")
            }
        }
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("Delegate: didFailToConnect.")
        print("Peripheral: \(peripheral)")
    }
}
