//
//  MyTableViewCell.swift
//  testDinamicTableView
//
//  Created by 백승엽 on 2020/11/19.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var userProfileImage: UIImageView!
    @IBOutlet var userContentLabel: UILabel!
    
    // 셀이 렌더링(그려질) 될때 호출
    // Nib 파일이 불려오면 호출
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
        
    }
}
