//
//  ThirdViewController.swift
//  weather_practice
//
//  Created by 이조은 on 2022/08/22.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource { //UITableViewDataSource => tableView의 데이터 소스 역할을 해줄것이다.

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var friends: [Friend] = [] //친구들 배열 만들고
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count //친구들 수 만큼 반환해라
    }
    
    //테이블 셀에 보일 데이터 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        //Friend(데이터 파일)에서 변수 정리하기 전
        //cell.textLabel?.text = friend.name + "(\(friend.age))"
        //cell.detailTextLabel?.text = friend.address_info.city + ", " + friend.address_info.country
        
        //정리 후
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        //데이터 가져오기
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        print(dataAsset)
    }

}
