//
//  ImageZoomViewController.swift
//  PhotosExampleWithSnapkit
//
//  Created by 이조은 on 2022/09/13.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    
    static let storyboardId = "imageZoomViewController"
    
    var asset: PHAsset! //전 화면에서 받아올 이미지
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    weak var imageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { image, _ in
            self.imageView.image = image
        })
    }

}
