//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 이조은 on 2022/08/22.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    //let cellIdentifier: String = "cell"
    let weatherCellIdentifier: String = "weatherCell"
    var weatherKr: [WeatherKr] = []
    
    var textToSet: String?
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1 //섹션 두 개 사용
    }
    // 테이블뷰에 섹션에 해당하는 로우의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherKr.count
    }
    // 해당 로우마다 해당하는 셀을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherTableViewCell =
        tableView.dequeueReusableCell(withIdentifier: self.weatherCellIdentifier, for: indexPath) as! WeatherTableViewCell
           
        let weather: WeatherKr = self.weatherKr[indexPath.row]
        
        cell.cityLabel?.text = weather.city_name
        cell.stateLabel?.text = "(\(weather.state))" + "/" + "(\(weather.elsius))"
        cell.rainfallLabel?.text = "(\(weather.rainfall_probability))"

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.topItem = "세계 날씨"
        self.title = self.textToSet
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        //데이터 가져오기
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "weatherKr") else {
            return
        }
        
        do {
            self.weatherKr = try jsonDecoder.decode([WeatherKr].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
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
