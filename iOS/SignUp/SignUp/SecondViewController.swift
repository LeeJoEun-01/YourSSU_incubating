//
//  SecondViewController.swift
//  SignUp
//
//  Created by 이조은 on 2022/08/06.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchSelectImageButton(_ senderl: UIButton) {
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
    
    //
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    // 화면에 보이기 직전에 세팅
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // @IBAction이란?   Interface Builder에 어떤 요소들이 event를 받았을 때 거기에 반응하기 위한 코드
    
    //POP Method 연결
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Dismiss Modal 코드로 기능 구현
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
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
