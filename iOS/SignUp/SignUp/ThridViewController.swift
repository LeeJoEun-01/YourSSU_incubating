//
//  ThridViewController.swift
//  SignUp
//
//  Created by 이조은 on 2022/08/07.
//

import UIKit

class ThridViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dataFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value Change")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dataFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // interface builder에서 value change가 될 때마다 값이 바뀌는 것을 코드로도 표현할 수 있다.
        self.datePicker.addTarget(self, action:
            #selector(self.didDatePickerValueChanged(_:)), for:
            UIControl.Event.valueChanged)
    }
    
    //이전
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    // 취소
    @IBAction func popToPrev2() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    // 가입
    @IBAction func popToPrev3() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
