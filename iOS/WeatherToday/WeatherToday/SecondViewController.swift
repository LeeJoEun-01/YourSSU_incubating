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
    var weatherKr: [WeatherKr] = []
    // 날씨 사진 데이터
    let weatherImgArr = ["sunny","snowy","rainy","cloudy"]
    
    var textToSet: String?

    // 테이블뷰 셀이 선택되면 회색이 되는데 다음 화면 갔다가 왔을때 원래대로
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // 테이블뷰에 섹션에 해당하는 로우의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.weatherKr.count)
        return self.weatherKr.count
    }
    // 해당 로우마다 해당하는 셀을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherTableViewCell =
        tableView.dequeueReusableCell(withIdentifier: self.weatherCellIdentifier, for: indexPath) as! WeatherTableViewCell
           
        let weatherKr: WeatherKr = self.weatherKr[indexPath.row]
        
        cell.cityLabel?.text = weatherKr.city_name
        
        // 배열에 있는 값들이 nil일 수도 있음으로 if let 바인딩일 활용한다.
        var state: Double = 0.0
        if let stateDouble = weatherKr.state, let celsiusDouble = weatherKr.celsius {
                cell.stateLabel?.text = "섭씨 \(stateDouble)도" + " / " + "화씨 \(celsiusDouble)도"
                state = stateDouble
            } else {
               print("error1: SecondViewController에서 stateDouble이나 celsiusDouble의 값이 이상합니다.")
            }
        
        var rain: Int = 0
        if let rainfallInt = weatherKr.rainfall_probability {
            cell.rainfallLabel?.text = "강수확률 "+"\(rainfallInt)"+"%"
            rain = rainfallInt
        } else {
           print("error2: SecondViewController에서 rainfallLabel의 값이 이상합니다.")
        }
        
        // 강수량과 섭씨별로 조건에 알맞는 이미지를 넣어준다.
        cell.rainfallLabel?.textColor = UIColor.black
        cell.stateLabel?.textColor = UIColor.black
        var weatherImg = UIImage(named: "\(weatherImgArr[0]).jpg")
        switch rain {
        case 0...35:  //맑음
            let weatherImg = UIImage(named: "\(weatherImgArr[0]).jpg")
            cell.weatherImage.image = weatherImg
        case 36...50:  //구름
            let weatherImg = UIImage(named: "\(weatherImgArr[3]).jpg")
            cell.weatherImage.image = weatherImg
        case 50..<60:
            if state <= 11.0 { //눈
                weatherImg = UIImage(named: "\(weatherImgArr[1]).jpg")
                cell.weatherImage.image = weatherImg
                // 섭씨에 따라 알맞는 text 색상 변경하기 (파란색)
                cell.stateLabel?.textColor = UIColor(displayP3Red: 0.1, green: 0.4, blue: 1.0, alpha: 1.0)
            } else { //구름
                let weatherImg = UIImage(named: "\(weatherImgArr[3]).jpg")
                cell.weatherImage.image = weatherImg
            }
        case 60...100:
            if state <= 11.0 { //눈
                weatherImg = UIImage(named: "\(weatherImgArr[1]).jpg")
                cell.weatherImage.image = weatherImg
                // 섭씨에 따라 알맞는 text 색상 변경하기 (파란색)
                cell.stateLabel?.textColor = UIColor(displayP3Red: 0.1, green: 0.4, blue: 1.0, alpha: 1.0)
            } else { //비
                weatherImg = UIImage(named: "\(weatherImgArr[2]).jpg")
                cell.weatherImage.image = weatherImg
                // 강수량 text 색상 변경하기 (주황색)
                cell.rainfallLabel?.textColor = UIColor(displayP3Red: 0.95, green: 0.5, blue: 0.1, alpha: 1.0)
            }
        default: //맑음
            weatherImg = UIImage(named: "\(weatherImgArr[0]).jpg")
            cell.weatherImage.image = weatherImg
        }

        return cell
    }
    //tableView cell 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 107
       }
    
    enum Country: String {
        case kr = "한국"
        case de = "독일"
        case it = "이탈리아"
        case us = "미국"
        case fr = "프랑스"
        case jp = "일본"
    }
    var kr: Country = .kr
    var de: Country = .de
    var it: Country = .it
    var us: Country = .us
    var fr: Country = .fr
    var jp: Country = .jp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation 색상 바꾸기
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(displayP3Red: 0.4, green: 0.6, blue: 1.0, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.tintColor = .white
        //navigationTitle 정하기
        self.navigationItem.title = textToSet
        // ! 최대한 사용하지 말기...!
        var countryFlag: String = self.textToSet ?? ""
        print(countryFlag)
        // 이전 화면에서 선택한 text를 가져와서 조건문으로 확인하고 가져올 데이터의 파일이름을 할당해준다.
        if countryFlag == kr.rawValue {
            countryFlag = "kr"
        } else if countryFlag == de.rawValue {
            countryFlag = "de"
        } else if countryFlag == it.rawValue {
            countryFlag = "it"
        } else if countryFlag == us.rawValue {
            countryFlag = "us"
        } else if countryFlag == fr.rawValue {
            countryFlag = "fr"
        } else if countryFlag == jp.rawValue {
            countryFlag = "jp"
        } else {
            print("오류입니다. SecondViewController -viewDidLoad()")
        }
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        //데이터 가져오기
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "\(countryFlag)") else {
            return
        }
        
        do {
            self.weatherKr = try jsonDecoder.decode([WeatherKr].self, from: dataAsset.data)
            print("O")
        } catch {
            print(error.localizedDescription)
            print("X")
        }
        
        self.tableView.reloadData()
        
    }

    // 다음 뷰컨트롤러로 정보를 넘겨주기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: ThirdViewController =
                segue.destination as? ThirdViewController else{
            return
        }
        guard let cell: WeatherTableViewCell = sender as? WeatherTableViewCell else {
            return
        }
        //text와 img 정보 넣어주기
        nextViewController.imageToSet = cell.weatherImage.image
        nextViewController.cityToSet = cell.cityLabel?.text
        nextViewController.stateToSet = cell.stateLabel?.text
        nextViewController.rainfallToSet = cell.rainfallLabel?.text
        //text color 넣어주기
        nextViewController.stateColorToSet = cell.stateLabel?.textColor
        nextViewController.rainColorToSet = cell.rainfallLabel?.textColor
        
    }

}
