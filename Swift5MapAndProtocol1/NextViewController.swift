//
//  NextViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by Takuya Ando on 2020/12/16.
//

import UIKit

// ボタンを押したときに緯度と経度を渡す
protocol SearchLocationDelegate {
  func searchLocation(latValue:String, logValue:String)
}

class NextViewController: UIViewController {

  // 緯度
  @IBOutlet weak var latTextField: UITextField!
  
  // 経度
  @IBOutlet weak var logTextField: UITextField!
  
  var delegate:SearchLocationDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func okAction(_ sender: Any) {
    // 入力された値を取得
    let latValue = latTextField.text!
    let logValue = logTextField.text!
    
    // 両方のテキストフィールドが空でなければ戻る
    if latTextField.text != nil && logTextField.text != nil {
      // delegateメソッドの引数に入れる
      delegate?.searchLocation(latValue: latValue, logValue: logValue)
      dismiss(animated: true, completion: nil)
    }
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
