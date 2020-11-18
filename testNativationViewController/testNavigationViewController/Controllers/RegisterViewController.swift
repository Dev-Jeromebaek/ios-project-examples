//
//  ViewController.swift
//  testNavigationViewController
//
//  Created by 백승엽 on 2020/11/18.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 상단 네비게이션 바 부분을 숨김처리한다.
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭!")
        // 네비게이션 뷰 컨트롤러를 합 한다.
        self.navigationController?.popViewController(animated: true)
    }
    
}

