//
//  ViewController.swift
//  testDinamicTableView
//
//  Created by 백승엽 on 2020/11/19.
//

import UIKit

class MyTableVC: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    let contentArray = [
        "simply dummy text of the printing and",
        
        "um has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type ",
        
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribestablished fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
        
        "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai",
        
        "established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
        
        "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai",
        
        "a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is thaai",
        
        "ho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it is pai",
        
        "ho loves pain itself, who seeks after it and wants to have it, simplho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it y because it is pai",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 셀 리소스 파일 가져오기
        // xib파일을 Nib 형식으로 변환하는 과정
//        let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        // 셀에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        
        // 단일 row의 높이
        self.myTableView.rowHeight = UITableView.automaticDimension
        // 단일 row의 예상 높이 (추정치)
        // 높이 추정치를 사용할 때 테이블 뷰는 스크롤 뷰에서 상속된 contentOffset 및 contentSize 속성을 능동적으로 관리한다.
        self.myTableView.estimatedRowHeight = 120
        
        // ***** 아주 중요 *****
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        print("contentArray.count : \(contentArray.count)")
    }

}

extension MyTableVC: UITableViewDelegate {
    
}

extension MyTableVC: UITableViewDataSource {
    
    // 테이블 뷰 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.userContentLabel.text = contentArray[indexPath.row]
        
        return cell
    }
    
    
}
