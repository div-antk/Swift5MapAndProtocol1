//
//  ViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by Takuya Ando on 2020/12/16.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate, UIGestureRecognizerDelegate, SearchLocationDelegate {


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
    
      let tapPoint = sender.location(in: view)
      
      // タップした位置（CGPoint）を指定してMKMapViewの緯度経度を取得
      let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
      
      let lat = center.latitude
      let log = center.longitude
    
      // 緯度経度から住所に変換
      convert(lat: lat, log: log)
    }
  }

  // 緯度と経度を使う
  func convert(lat:CLLocationDegrees,
               log:CLLocationDegrees) {
    let geocoder = CLGeocoder()
    let location = CLLocation(latitude: lat, longitude: log)
    
    // クロージャー
    // クロージャーの中に入ってるものは self を書く
    // 値が入ったあとにカッコ内が呼ばれ、値が入るまではカッコの外が呼ばれる
    geocoder.reverseGeocodeLocation(location) {
      (placeMark, error) in
      
      if let placeMark = placeMark {
        if let pm = placeMark.first {
          if pm.administrativeArea != nil || pm.locality != nil {
            
            // namaはランドマークの名前
            self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
          } else {
            self.addressString = pm.name!
          }
          self.addressLabel.text = self.addressString
        }
      }
    }
  }
  
  @IBAction func goToSearchVC(_ sender: Any) {
    performSegue(withIdentifier: "next", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "next" {
      let nextVC = segue.destination as! NextViewController
      nextVC.delegate = self
    }
  }
  
  // 任されたデリゲートメソッド
  func searchLocation(latValue: String, logValue: String) {
    if latValue.isEmpty != true && logValue.isEmpty != true {
      let latString = latValue
      let logString = logValue
    
      // 緯度経度を元にコーディネート
      let cordinate = CLLocationCoordinate2DMake(Double(latString)!, Double(logString)!)
      
      // 表示する範囲を指定
      let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
      
      // 領域を指定
      let region = MKCoordinateRegion(center: cordinate, span: span)
      
      // 領域をmapViewに設定
      mapView.setRegion(region, animated: true)
      
      // 緯度経度から住所を取得
    }
  }
}
