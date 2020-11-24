//
//  MyCollectionVC.swift
//  testDinamicTableView
//
//  Created by 백승엽 on 2020/11/23.
//

import Foundation
import UIKit

class MyCollectionVC: UIViewController {
    
    @IBOutlet var mySegmentControl: UISegmentedControl!
    @IBOutlet var myCollectionView: UICollectionView!
    
    fileprivate let systemImageNameArray = [
            "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
        ]
    
    
    //MARK: - Lifecyles
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MyCollectionVC - viewDidLoad() called")
        
        // 컬렉션뷰에 대한 설정
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        // 데이터에 따른 셀 UI 변경
        // 3. Nib 파일로 만들어서 제공하기 (사용할 컬렉션뷰 셀을 등록)
        
        // Nib파일을 가져옴
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
        // 가져온 Nib파일로 컬렉션뷰에 셀로 등록
        self.myCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        // 등록 이후 DataSource 설정
        
        // ----- FlowView
        // 컬렉션뷰의 컬렉션뷰 레이아웃을 설정
        self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
    }
    
    @IBAction func onCollectionViewTypeChanged(_ sender: UISegmentedControl) {
        print("MyCollectionVC - onCollectionViewTypeChanged() called / sender : \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            // 테이블뷰 형태
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
        case 1:
            // 2 x 2 그리드 형태
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForSecond()
        case 2:
            // 3 x 3 그리드 형태
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForThird()
        default:
            break
        }
    }
    
}

//MARK: - 컬렉션뷰 콤포지셔널 레이아웃 관련
extension MyCollectionVC {
    
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayoutForFirst() -> UICollectionViewLayout {
        print("createCompositionalLayoutForFirst() called")
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 컬렉션 레이아웃 섹션을 반환해야함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute는 고정값, estimated는 추측, freaction 퍼센트
            // .fractionalWidth(1.0) 가로 100% (1/3) 3분의1
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 사이 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 변경될 height 변수화
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
//            section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
    
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayoutForSecond() -> UICollectionViewLayout {
        print("createCompositionalLayoutForSecond() called")
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 컬렉션 레이아웃 섹션을 반환해야함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute는 고정값, estimated는 추측, freaction 퍼센트
            // .fractionalWidth(1.0) 가로 100% (1/3) 3분의1
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 사이 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 변경될 height 변수화
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
//            section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
    
    // 콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayoutForThird() -> UICollectionViewLayout {
        print("createCompositionalLayoutForThird() called")
        // 콤포지셔널 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 컬렉션 레이아웃 섹션을 반환해야함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute는 고정값, estimated는 추측, freaction 퍼센트
            // .fractionalWidth(1.0) 가로 100% (1/3) 3분의1
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 사이 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 변경될 height 변수화
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            // 그룹 사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
//            section.orthogonalScrollingBehavior = .groupPaging
            
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
}

// 데이터 소스 설정 - 데이터와 관련된 것들
extension MyCollectionVC: UICollectionViewDataSource {
    
    // 각 섹션에 들어가는 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    
    // 각 컬렉션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 객체 인스턴스의 이름을 가져와서 cellId로 설정
        let cellId = String(describing: MyCollectionViewCell.self)
        print("cellId: \(cellId)")
        
        // 셀의 인스턴스 - 1, 2
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        // 셀의 인스턴스 - 3
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCustomCollectionViewCell.self), for: indexPath) as! MyCustomCollectionViewCell
        
        // 데이터에 따른 셀 UI 변경
        // 1. 컨트롤러에서 직접 만들기
        // 이미지에 대한 설정
//        cell.profileImg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
//        // 라벨 설정
//        cell.profileLabel.text = self.systemImageNameArray[indexPath.item]
        
        
//                cell.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//                cell.contentView.layer.cornerRadius = 8
//                cell.contentView.layer.borderWidth = 1
//                cell.contentView.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)

        
        
        // 데이터에 따른 셀 UI 변경
        // 2. Cell을 관리하는 별도의 파일로 분리하여 만들기
        // 데이터에 따른 셀 UI 변경을 MyCollectionViewCell.swift 에서 직접 할 수도 있음
        // MyCollectionViewCell.swift 에서 작업 이후
        cell.imageName = self.systemImageNameArray[indexPath.item]
        
        return cell
    }
    
    
}

// 컬렉션뷰 델리겟 - 액션과 관련된 것들
extension MyCollectionVC: UICollectionViewDelegate {
    
}
