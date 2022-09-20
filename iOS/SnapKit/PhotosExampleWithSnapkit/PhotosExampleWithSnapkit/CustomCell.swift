//
//  CustomCell.swift
//  PhotosExampleWithSnapkit
//
//  Created by 이조은 on 2022/09/20.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let cellId = "customCell"
    
    let photoView = UIImageView()
    let nextBtn = UIButton()
    
    //let nextIcon: UIImage = UIImage(named: "chevron.right")!
    //nextBtn.setImage(nextIcon, for: .normal)
    
    //스토리보드로 셀을 작성하게 될 경우 초기화를 해주기 때문에 안해줘도 되지만 코드로 작성하게 될 경우에는 작성해야 한다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }

    private func setViewHierarchy() {
        self.addSubview(photoView)
        self.addSubview(nextBtn)
    }

    private func setConstraints() {
        photoView.snp.makeConstraints{
            $0.centerY.equalTo(self)
            $0.left.equalTo(self).offset(20)
            $0.size.width.height.equalTo(60)
        }

        nextBtn.snp.makeConstraints{
            $0.leading.equalTo(self).offset(330)
            $0.centerY.equalTo(self)
            $0.size.width.height.equalTo(20)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
