//
//  ViewController.swift
//  PhotosExampleWithSnapkit
//
//  Created by 이조은 on 2022/09/13.
//

import UIKit
import SnapKit
import Photos

class ViewController: UIViewController {
    
    var tableView : UITableView = {
        let tableView = UITableView()
            
        return tableView
    }()
    
    var fetchResult: PHFetchResult<PHAsset>!
    //이미지를 로드해올 친구
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"
    
    @objc
    func touchUpRefreshButton(_ sender: UIBarButtonItem) {
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult)
            else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        
        //변화된것이 있으면 이미지를 다시 불러온다.
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    func requestCollection() {
        // 카메라로 찍으면 저장되는
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions()
        //최신순으로 sort
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    func setViewHierarchy() {
        self.view.addSubview(tableView)
    }
    func setConstraints() {
        tableView.snp.makeConstraints{
            $0.bottom.left.right.top.equalToSuperview()
        }
    }
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        // navigation bar에 item 추가하기
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(touchUpRefreshButton))
        self.navigationItem.title = "사진들"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        
        //사용자가 사진첩에 접근을 허가 했는지 확인
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()

        switch photoAurhorizationStatus {
        case .notDetermined:
            print("아직 응답하지 않음")
            //다시 응답
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        case .denied:
            print("접근 불허")
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        case .limited:
            print("강의엔 없음")
        @unknown default:
            print("강의엔 없음")
        }
        
        setLayouts()
        setPhoto()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
            super.setEditing(editing, animated: true)
            tableView.setEditing(editing, animated: true)
    }
    
    //tableView cell 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat {
               return 80
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 편집이 delete라면
        if editingStyle == .delete {
            let asset: PHAsset = self.fetchResult[indexPath.row]

            // 삭제 버튼이 눌릴때 나오는 경고창
            PHPhotoLibrary.shared().performChanges(
                {PHAssetChangeRequest.deleteAssets([asset] as NSArray)
                }, completionHandler: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell

        let asset: PHAsset = fetchResult.object(at: indexPath.row)

        //실질적인 이미지 요청
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            cell.photoView.image = image
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = ImageZoomViewController()
        let index: IndexPath = indexPath
        nextViewController.asset = self.fetchResult[index.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension ViewController: PHPhotoLibraryChangeObserver {
    func setPhoto() {
        PHPhotoLibrary.shared().register(self)

    }
}
