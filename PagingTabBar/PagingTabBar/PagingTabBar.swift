//
//  PagingTabBar.swift
//  PagingTabBar
//
//  Created by 윤병일 on 2023/02/01.
//

import UIKit
import SnapKit

protocol PagingDelegate : AnyObject {
  func didTapPagingTabBarCell(scrollTo indexPath : IndexPath)
}

class PagingTabBar : UIView {
  
  // MARK: - Propeties
  
  var cellHeight : CGFloat { 44.0 }

  private var categoryTitleList : [String]
  
  weak var delegate : PagingDelegate?
  
  lazy var collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let inset : CGFloat = 16.0
    layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - inset*2.0)/5.0, height: cellHeight)
    layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    layout.minimumLineSpacing = 0.0
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.delegate = self
    collectionView.dataSource = self
    
    
    return collectionView
  }()
  
  
  // MARK: - Init
  init(categoryTitleList : [String]) {
    self.categoryTitleList = categoryTitleList
    super.init(frame: .zero)
    setupLayout()
    collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: []) // 처음에 첫 탭에 포커싱
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Functions
  
  func setupLayout() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}


  // MARK: - UICollectionViewDataSource
extension PagingTabBar : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryTitleList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagingTabBarCell.identifier, for: indexPath) as? PagingTabBarCell else {
      return UICollectionViewCell()
    }

    return cell
  }
}

  // MARK: - UICollectionViewDelegateFlowLayout
extension PagingTabBar : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didTapPagingTabBarCell(scrollTo: indexPath)
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
}
