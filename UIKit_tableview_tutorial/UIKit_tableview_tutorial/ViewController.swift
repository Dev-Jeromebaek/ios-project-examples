//
//  ViewController.swift
//  UIKit_tableview_tutorial
//
//  Created by 백승엽 on 2020/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
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
        
        // nib파일 가져오기
        let tableViewCellNib = UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        
        // 셀에 리소스(nib파일) 등록
        self.tableView.register(tableViewCellNib, forCellReuseIdentifier: "tableViewCell")
        
        // 단일 row의 높이
        self.tableView.rowHeight = UITableView.automaticDimension
        // 단일 row의 예상 높이 (추정)
        // 높이 추정치를 사용할 때 테이블 뷰는 스크롤 뷰에서 상속된 contentOffset 및 contentSize 속성을 능동적으로 관리한다.
        self.tableView.estimatedRowHeight = 120
        
        // ***** 중요 ***** delegate, datasource 연결
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {

    // 테이블 뷰 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }

    // 각 Cell에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        
        cell.userContentLabel.text = contentArray[indexPath.row]
        
        return cell
        
    }


}
