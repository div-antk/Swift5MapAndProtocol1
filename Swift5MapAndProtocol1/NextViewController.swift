//
//  NextViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by Takuya Ando on 2020/12/16.
//

import UIKit

// ボタンを押したときに緯度と経度を渡す
protocol <#name#> {
  <#requirements#>
}

class NextViewController: UIViewController {

  // 緯度
  @IBOutlet weak var latTextField: UITextField!
  
  // 経度
  @IBOutlet weak var logTextField: UITextField!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
