//
//  ViewController.swift
//  AsyncExampleWithSnapKit
//
//  Created by 이조은 on 2022/09/13.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray3
            
        return view
    }()
    
    let downloadBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //최종적으로 setLayout만 호출
        setLayouts()
        
        downloadBtn.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
// 유어슈 SnapKit 규칙 참고!!
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    // addSubview만 넣기
    func setViewHierarchy() {
        self.view.addSubview(imageView)
        self.view.addSubview(downloadBtn)
    }
    // makeConstraints만 넣기
    func setConstraints() {
        imageView.snp.makeConstraints{
            $0.width.equalTo(260)
            $0.height.equalTo(182)
            $0.top.equalTo(self.view).offset(150)
            $0.centerX.equalTo(view.snp.centerX)
        }

        downloadBtn.snp.makeConstraints{
            $0.top.equalTo(self.imageView).offset(230)
            $0.centerX.equalTo(view.snp.centerX)
        }
    }
    
    @objc
    func clickButton(_ sender: UIButton) {
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg

        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!

        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!

            // 위의 작업이 끝나면 다시 main thread로 와서 작업하자
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
//        let imageData: Data = try! Data.init(contentsOf: imageURL)
//        let image: UIImage = UIImage(data: imageData)!
//        self.imageView.image = image
//        self.view.addSubview(self.imageView)
        print("click")
    }

}

