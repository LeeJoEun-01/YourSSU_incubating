//
//  ViewController.swift
//  weather_practice
//
//  Created by 이조은 on 2022/08/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    //데이터
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","V","W","X","Y","Z"]
    //빈 배열
    var dates: [Date] = []
    
    //날짜만
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    //시간만
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
        
    // 'Add Data' 버튼 액션
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        dates.append(Date())
            
        // self.tableView.reloadData() // 전체의 데이터를 다시
                
        //애니메이션 추가
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
    // 인터페이스 빌더에서 연결해주는 것과 같은 역할
            self.tableView.delegate = self
            self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 3 //섹션 두 개 사용
    }
    // 테이블뷰에 섹션에 해당하는 로우의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    // 해당 로우마다 해당하는 셀을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            
            // 데이터셀의 재사용 확인
//            if indexPath.row == 1 {
//                cell.backgroundColor = UIColor.red
//            } else {
//                cell.backgroundColor = UIColor.white
//            }
            
            return cell
        } else {
            let cell: CustomTableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
                        
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            return cell
        }
    }
    //테이블뷰 섹션에 header주기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 네비게이션 쓰기 전에 준비해야 할 것이 있다.
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
        // textLabel에 text를 직접 세팅하려고 하면 (화면에 올라갈 메모리가 아직 없기 때문에)
        // nextViewController.textLabel.text = cell.textLabel?.text
    }
}

