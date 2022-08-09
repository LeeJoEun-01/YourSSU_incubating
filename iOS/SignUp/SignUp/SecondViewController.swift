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
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchSelectImageButton(_ sender: UIButton) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 다음 버튼 disabled
        nextBtn.isEnabled = false
        self.id.delegate = self
        self.pwd1.delegate = self
        self.pwd2.delegate = self
        self.intro.delegate = self
        
        
        //3. delegate 사용할 때
        let tapGesture: UITapGestureRecognizer =
            UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }
    // 화면에 보이기 직전에 세팅
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //버튼 활성화 조건문
    func textFieldDidEndEditing(_ textField: UITextField) {
        if pwd1.text?.isEmpty == true{
            
        }else if pwd1.text == pwd2.text{
            if id.text?.isEmpty == false{
                nextBtn.isEnabled = true
            }
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
    

}
