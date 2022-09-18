//
//  ViewController.swift
//  AsyncExample
//
//  Created by 이조은 on 2022/09/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지뷰 세팅
        
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        // https 이미지가 아닌 http 주소의 이미지를 사용하고 싶다면 info에 규칙 추가
        
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!
        
        //OperationQueue를 사용하여 main thread가 아닌 다른 thread에서 동작함으로 문제가 발생하지 않는다.
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            
            // 위의 작업이 끝나면 다시 main thread로 와서 작업하자
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

