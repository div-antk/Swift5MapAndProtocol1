//
//  ViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by Takuya Ando on 2020/12/16.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate, UIGestureRecognizerDelegate {

  var addressString = ""
  
  @IBOutlet var longPress: UILongPressGestureRecognizer!
  @IBOutlet weak var settingButton: UIButton!
  
  @IBOutlet weak var mapView: MKMapView!
  var locManager:CLLocationManager!
  
  @IBOutlet weak var addressLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    settingButton.backgroundColor = .white
    settingButton.layer.cornerRadius = 20.0
  }

  // senderはlongTapのこと
  @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
    
    // タップを開始した
    if sender.state == .began{
    
    // タップを終了した
    } else if sender.state == .ended {
    
      // タップした位置を指定してMKMap上の緯度と経度を取得する
      
      
      // 緯度経度から住所に変換
      
    }
  }

  // 緯度と経度を使う
  func convert(lat:CLLocationDegrees,
               log:CLLocationDegrees) {
    let geocoder = CLGeocoder()
    let location = CLLocation(latitude: lat, longitude: log)
    
    // クロージャー
    // 値が入ったあとにカッコ内が呼ばれ、値が入るまではカッコの外が呼ばれる
    geocoder.reverseGeocodeLocation(location) {
      (placeMark, error) in
      
      if let placeMark = placeMark {
        if let pm = placeMark.first {
          if pm.administrativeArea != nil || pm.locality != nil {
            
            // namaはランドマークの名前
            self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
          }
        }
      }
    }
  }
}
