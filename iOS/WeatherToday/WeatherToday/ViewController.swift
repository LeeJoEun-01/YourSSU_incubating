//
//  ViewController.swift
//  WeatherToday
//
//  Created by 이조은 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    //let cellIdentifier: String = "cell"
    let countryCellIdentifier: String = "countryCell"
    
    //데이터
    let country: [String] = ["한국","독일","이탈리아","미국","프랑스","일본"]
    let flag = ["flag_kr","flag_de","flag_it","flag_us","flag_fr","flag_jp"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationItem.title = "세계 날씨"
        self.title = "세계 날씨"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1 //섹션 두 개 사용
    }
    // 테이블뷰에 섹션에 해당하는 로우의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    // 해당 로우마다 해당하는 셀을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CountryTableViewCell =
        tableView.dequeueReusableCell(withIdentifier: self.countryCellIdentifier, for: indexPath) as! CountryTableViewCell
           
        let text: String = country[indexPath.row]
        cell.countryLabel.text = text
        //이미지 데이터 불러오기
        let flagImg = UIImage(named: "\(flag[indexPath.row]).jpg")
        cell.flag.image = flagImg

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: SecondViewController =
                segue.destination as? SecondViewController else{
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        nextViewController.textToSet = cell.textLabel?.text
    }


}

