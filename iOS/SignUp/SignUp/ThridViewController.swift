//
//  ThridViewController.swift
//  SignUp
//
//  Created by 이조은 on 2022/08/07.
//

import UIKit

class ThridViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    var dateCheck: Bool = false
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    @objc func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value Change")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        dateCheck = true
    }
    @IBOutlet weak var registerBtn: UIButton!
    //전화번호 textField
    @IBOutlet weak var number: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // interface builder에서 value change가 될 때마다 값이 바뀌는 것을 코드로도 표현할 수 있다.
        self.datePicker.addTarget(self, action:
            #selector(self.didDatePickerValueChanged(_:)), for:
            UIControl.Event.valueChanged)
        
        // 조건 충족 전까지 가입 버튼 disabled
        registerBtn.isEnabled = false
        self.number.delegate = self
        
        //3. delegate 사용할 때
        let tapGesture: UITapGestureRecognizer =
            UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    // 서브뷰의 레이아웃이 변경된 후 호출되는 메서드 > 서브 뷰의 레이아웃을 변경한 후 추가적인 작업을 수행하기 좋은 시점
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if( number.text?.count == 11 && dateCheck == true){
            registerBtn.isEnabled = true
        } else{
            registerBtn.isEnabled = false
        }
    }
    
    // delegate 메서드 만들기
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //이전
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    // 취소
    @IBAction func popToPrev2() {
        self.navigationController?.popViewController(animated: true)
    }
    // 가입
    @IBAction func popToPrev3() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
