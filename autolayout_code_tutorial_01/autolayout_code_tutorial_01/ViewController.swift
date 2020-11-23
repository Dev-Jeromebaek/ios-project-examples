//
//  ViewController.swift
//  autolayout_code_tutorial_01
//
//  Created by 백승엽 on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {

    // 클로저로 뷰를 설정
    var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        // cornerRadius 설정할때 clipsToBounds 설정을 해줘야 제대로 들어감
        view.clipsToBounds = true
        return view
    }()
    
    var thirdView: CircleView = {
        let circleView = CircleView()
        circleView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let firstView = UIView()
        // storyboard로 레이아웃을 잡지않고 코드로 UI를 구성한다면
        // view에 translatesAutoresizingMaskIntoConstraints 설정을 false로 해줘야 한다.
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .systemPink
        self.view.addSubview(firstView)
        
        // x축, y축 위치, 가로, 세로
        // 위치 설정 하고 .isActive를 통해 확정을 지어줘야함.
        firstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        firstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        // 뷰의 가로, 세로 크기 제공
        firstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        firstView.layer.cornerRadius = 30
        
        self.view.addSubview(secondView)
        // .isActive를 NSLayoutConstraint.activate로 묶어서 처리할 수 있다.
        NSLayoutConstraint.activate([
            secondView.widthAnchor.constraint(equalToConstant: 100),
            secondView.heightAnchor.constraint(equalToConstant: 100),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 0),
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 20)
        ])
        
        self.view.addSubview(thirdView)
        thirdView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 1.5).isActive = true
        thirdView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 1.5).isActive = true
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 50).isActive = true
        thirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }


}


// SwiftUI의 preview 보기 기능 설정
#if DEBUG

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
    
    @available(iOS 13.0, *)
    // makeUI
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

#endif

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDisplayName("iPhone 12 Pro")
    }
}
