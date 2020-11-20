//
//  TableViewCell.swift
//  UIKit_tableview_tutorial
//
//  Created by 백승엽 on 2020/11/20.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var userProfileImage: UIImageView!
    @IBOutlet var userContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("TableViewCell - awakeFromNib() called")
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
    }
}
