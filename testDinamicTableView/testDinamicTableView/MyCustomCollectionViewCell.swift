//
//  MyCollectionViewCell.swift
//  testDinamicTableView
//
//  Created by 백승엽 on 2020/11/23.
//

import Foundation
import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var profileImg: UIImageView!
    
    var imageName: String = "" {
        didSet {
            print("MyCustomCollectionViewCell / imageName - didSet() : \(imageName)")
            // 이미지에 대한 설정
            self.profileImg.image = UIImage(systemName: imageName)
            // 라벨 설정
            self.profileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyCustomCollectionViewCell - awakeFromNib() called")
        
        // self는 써도 되고 안써도 되고
        self.contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)

    }
}
