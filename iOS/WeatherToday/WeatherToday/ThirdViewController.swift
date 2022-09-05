//
//  ThridViewController.swift
//  WeatherToday
//
//  Created by 이조은 on 2022/08/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var imageToSet: UIImage?
    var cityToSet: String?
    var stateToSet: String?
    var rainfallToSet: String?
    
    var stateColorToSet: UIColor?
    var rainColorToSet: UIColor?
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = self.cityToSet
        
        // 데이터 가져온거 넣어주기
        self.weatherImg?.image = self.imageToSet
        self.stateLabel?.text = self.stateToSet
        self.rainfallLabel?.text = self.rainfallToSet
        //색상 정보
        self.stateLabel?.textColor = self.stateColorToSet
        self.rainfallLabel?.textColor = self.rainColorToSet
        
        //print(self.weatherImg?.image)
        if self.imageToSet == UIImage(named: "sunny.jpg") {
            self.weatherLabel?.text = "맑음"
        } else if self.imageToSet == UIImage(named: "snowy.jpg") {
            self.weatherLabel?.text = "눈"
        } else if self.imageToSet == UIImage(named: "rainy.jpg") {
            self.weatherLabel?.text = "비"
        } else {
            self.weatherLabel?.text = "구름"
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
