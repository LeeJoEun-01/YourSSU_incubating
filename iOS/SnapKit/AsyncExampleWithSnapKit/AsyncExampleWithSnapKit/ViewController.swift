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
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints{ (make) in
            make.width.equalTo(260)
            make.height.equalTo(182)
            make.top.equalTo(self.view).offset(150)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        self.view.addSubview(downloadBtn)
        downloadBtn.snp.makeConstraints{ (make) in
            make.top.equalTo(self.imageView).offset(230)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        downloadBtn.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        
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
                self.view.addSubview(self.imageView)
            }
        }
        print("click")
    }

}

