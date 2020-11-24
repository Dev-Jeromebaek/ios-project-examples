//
//  MyCollectionViewCell.swift
//  testDinamicTableView
//
//  Created by 백승엽 on 2020/11/23.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var profileLabel: UILabel!
    
    // 데이터에 따른 셀 UI 변경
    // 2. Cell을 관리하는 별도의 파일로 분리하여 만들기
    // 작업 이후 MyCollectionVC에서 imageName 설정
    var imageName: String = "" {
        didSet {
            print("MyCollectionViewCell / imageName - didSet() : \(imageName)")
            // 이미지에 대한 설정
            self.profileImg.image = UIImage(systemName: imageName)
            // 라벨 설정
            self.profileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyCollectionViewCell - awakeFromNib() called")
        
        // self는 써도 되고 안써도 되고
        self.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)

    }
}
