//
//  SecondViewController.swift
//  weather_practice
//
//  Created by 이조은 on 2022/08/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
        
    @IBOutlet weak var textLabel: UILabel!
    
    //셀 클릭했을 때 cell 정보 가져오기
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textLabel?.text = self.textToSet
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 네비게이션 쓰기 전에 준비해야 할 것이 있다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
