//
//  ImageZoomViewController.swift
//  PhotosExampleWithSnapkit
//
//  Created by 이조은 on 2022/09/13.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var scrollView: UIScrollView = {
      let view = UIScrollView()
      // UIScrollView의 minimumZoomScale, maximumZoomScale, bounces, indicator 설정
      view.minimumZoomScale = 1.0
      view.maximumZoomScale = 3.0
      view.bounces = false
      view.showsVerticalScrollIndicator = false
      view.showsHorizontalScrollIndicator = false
      return view
    }()
    
    var asset: PHAsset! //전 화면에서 받아올 이미지
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    private let imageView = UIImageView()
    
    //viewForZooming(in:) 메소드 구현
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func setViewHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    func setConstraints() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.size.size.equalTo(500)
            //$0.bottom.equalToSuperview().offset(-100)
            $0.leading.trailing.equalToSuperview()
        }
    }
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView의 delegate 할당
        self.scrollView.delegate = self
        view.backgroundColor = .white

        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { image, _ in
            self.imageView.image = image
        })
        
        setLayouts()
    }

}
