//
//  ViewController.swift
//  UIKit_scrollview_tutorial
//
//  Created by 백승엽 on 2020/11/19.
//

import UIKit

//MARK: - 스크롤 뷰
// - 스크롤 가능한 컨텐트 뷰를 제공해야 스크롤뷰가 제대로 작동
// - 컨텐트 레이아웃: 스크롤 가능한 사이즈
// - 프레임 레이아웃: 부모뷰와 관련있는 스크롤뷰의 사이즈
// - 컨텐트 레이아웃 크기를 설정해줘야 한다.
// - 스크롤뷰 안에 들어가는 내용물의 탑, 바텀 앵커를 컨텐트 레이아웃의 바텀, 탑 앵커와 일치 시켜야 한다.

//MARK: - 스크롤 뷰 적용하기
// 1. 스크롤뷰 크기 + 위치 잡기
// 2. UIView로 컨테이너 뷰 잡으면 편함
// 3. Content layout - 스크롤 가능한 영역
// 4. 스크롤뷰 안에 들어가는 녀석의 앵커와 content layout의 앵커를 일치
// 5. 스크롤 가능한 영역 조절 = frame layout guide와 컨테이너 뷰 맞추기

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

