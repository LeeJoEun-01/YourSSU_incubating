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
        // self.addSubview(nextBtn)
        // 기존 코드를 해석하면 cell에 photoView와 nextBtn이 올라가고 그 위에 contentView가 올라가기 때문에
        // self.contentView.addSubview(nextBtn)로 코드를 작성해 주어야지 contentView 위에 nextBtn이 올라간다.
    }

    private func setConstraints() {
        photoView.snp.makeConstraints{
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).offset(20)
            $0.size.equalTo(60)
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
