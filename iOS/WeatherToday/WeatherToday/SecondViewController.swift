//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 이조은 on 2022/08/22.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    //let cellIdentifier: String = "cell"
    let weatherCellIdentifier: String = "weatherCell"
    // 나라 날씨 배열 데이터
    var kr: [WeatherKr] = []
    // 날씨 사진 데이터
    let weatherImgArr = ["sunny","snowy","rainy","cloudy"]
    
    var textToSet: String?
    
    // 테이블뷰에 섹션에 해당하는 로우의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.kr.count)
        return self.kr.count
    }
    // 해당 로우마다 해당하는 셀을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherTableViewCell =
        tableView.dequeueReusableCell(withIdentifier: self.weatherCellIdentifier, for: indexPath) as! WeatherTableViewCell
           
        let weatherKr: WeatherKr = self.kr[indexPath.row]
        
        cell.cityLabel?.text = weatherKr.city_name
        // 배열에 있는 값들이 nil일 수도 있음으로 if let 바인딩일 활용한다.
        var state: Double = 0.0
        if let stateDouble = weatherKr.state {
            if let celsiusDouble = weatherKr.celsius {
                cell.stateLabel?.text = "섭씨 \(stateDouble)도" + " / " + "화씨 \(celsiusDouble)도"
                state = stateDouble
            } else {
                print("error: SecondViewController1")
            }
        } else {
           print("error: SecondViewController2")
        }
        var rain: Int = 0
        if let rainfallInt = weatherKr.rainfall_probability {
            cell.rainfallLabel?.text = "강수확률 "+"\(rainfallInt)"+"%"
            rain = rainfallInt
        } else {
           print("error: SecondViewController3")
        }
        // 강수량과 섭씨별로 조건에 알맞는 이미지를 넣어준다.
        if rain >= 70 {
            let weatherImg = UIImage(named: "\(weatherImgArr[2]).jpg")
            cell.weatherImage.image = weatherImg
        } else {
            if rain >= 35 {
                if rain <= 50 && state <= 10.0 {
                    let weatherImg = UIImage(named: "\(weatherImgArr[1]).jpg")
                    cell.weatherImage.image = weatherImg
                } else {
                    let weatherImg = UIImage(named: "\(weatherImgArr[3]).jpg")
                    cell.weatherImage.image = weatherImg
                }
            } else {
                let weatherImg = UIImage(named: "\(weatherImgArr[0]).jpg")
                cell.weatherImage.image = weatherImg
            }
        }

        return cell
    }
    //tableView cell 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 107
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.topItem = "세계 날씨"
        //self.title = self.textToSet
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        //데이터 가져오기
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "kr") else {
            return
        }
        
        do {
            self.kr = try jsonDecoder.decode([WeatherKr].self, from: dataAsset.data)
            print("O")
        } catch {
            print(error.localizedDescription)
            print("X")
        }
        
        self.tableView.reloadData()
        print(kr)
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
