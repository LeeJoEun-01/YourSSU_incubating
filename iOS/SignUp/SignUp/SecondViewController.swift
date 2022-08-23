//
//  SecondViewController.swift
//  SignUp
//
//  Created by 이조은 on 2022/08/06.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary  // 이미지 앨범에서 가져옴
        picker.allowsEditing = true // 이미지 편집 가능 여부
        picker.delegate = self //picker delegate
        return picker
    }()

    @IBOutlet weak var imageView: UIImageView!
    var imageExist: Bool = false

    // imageView Tap 감지 후 imagePicker 제공 (picker를 보여줄 메서드 정의)
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    

    // 이미지 피커가 이미지가 선택되었을 때 우리에게 이미지를 보여주는 Delegate 만들기
    // 취소하기 눌렀을 때 모달 창 닫기
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    // 이미지 가져와서 보여주기
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
            self.imageView.alpha = 1
            imageExist = true
        }

        self.dismiss(animated: true, completion: nil)
    }
    
    //다음 버튼 조건 만족전까지는 비활성화
    @IBOutlet weak var nextBtn: UIButton!
    
    //조건에 필요한 변수들
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pwd1: UITextField!
    @IBOutlet weak var pwd2: UITextField!
    @IBOutlet weak var intro: UITextView!
    var countNum: Int = 0
    
    // 자기소개 글자 수 보여주기
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.alpha = 0.1
        self.imageView?.isUserInteractionEnabled = true
        self.imageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageViewTapped)))
        
        // password 암호화
        pwd1.textContentType = .newPassword
        pwd1.isSecureTextEntry = true
        pwd2.textContentType = .newPassword
        pwd2.isSecureTextEntry = true
        
        // 다음 버튼 disabled
        self.enabledBtn(isOn: false)
        //nextBtn.isEnabled = false
        self.id.delegate = self
        self.pwd1.delegate = self
        self.pwd2.delegate = self
        self.intro.delegate = self
        
        // 처음 화면에 로드되었을 떄 카운트 되지 않았음을 보여주기
        countLabel.text = "0 / 100"
        
        
        //3. delegate 사용할 때
        let tapGesture: UITapGestureRecognizer =
            UITapGestureRecognizer()
        tapGesture.delegate = self

        self.view.addGestureRecognizer(tapGesture)
    }
    
    //버튼 활성화
    func enabledBtn(isOn: Bool){
        switch isOn{
        case true:
            nextBtn.isEnabled = true
        case false:
            nextBtn.isEnabled = false
        }
    }
    
    // 서브뷰의 레이아웃이 변경된 후 호출되는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("변경\(countNum)")
        print(intro.text.count)
        if id.text?.count == 0 || pwd1.text?.count == 0 {
            self.enabledBtn(isOn: false)
            //nextBtn.isEnabled = false
        } else {
            if pwd1.text == pwd2.text && (intro.text.count)+1 >= 15 && imageExist == true {
                self.enabledBtn(isOn: true)
                //nextBtn.isEnabled = true
            }
            else {
                self.enabledBtn(isOn: false)
            }
        }
        countNum = countNum + 1
    }
    
    //Text가 채워졌느지 확인
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if intro.text?.isEmpty == false{
//            self.enabledBtn(isOn: false)
//        } else if pwd1.text?.isEmpty == false && pwd1.text == pwd2.text && id.text?.isEmpty == false && imageCheck == true && intro.text.count >= 15 {
//            self.enabledBtn(isOn: true)
//        }
//
//    }
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if id.text?.isEmpty == true && pwd1.text?.isEmpty == true{
//            self.enabledBtn(isOn: false)
//        } else if intro.text.count >= 15 && imageCheck == true {
//            self.enabledBtn(isOn: true)
//        }
//    }
    
    //ID 싱글턴에 넣기
    override func viewDidDisappear(_ animated: Bool){
        UserInformation.shared.id = id.text
    }
    
    // TextView 글자 수 Count
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = intro.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {return false}
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        countLabel.text = "\(changedText.count) / 100"
        
        return true
    }

    
    // delegate 메서드 만들기
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    //이전
    @IBAction func popToPrev() {
        UserInformation.shared.id = ""
        self.navigationController?.popViewController(animated: true)
    }
    

}
