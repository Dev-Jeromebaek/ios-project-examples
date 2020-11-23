//
//  circleView.swift
//  autolayout_code_tutorial_01
//
//  Created by 백승엽 on 2020/11/23.
//

import Foundation
import UIKit

class CircleView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        print("CircleView - layoutSubview() called")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
