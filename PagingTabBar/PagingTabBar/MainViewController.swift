//
//  MainViewController.swift
//  PagingTabBar
//
//  Created by 윤병일 on 2023/02/01.
//

import UIKit
import SnapKit

class MainViewController : UIViewController {
  
  // MARK: - Properties
  
  private let categoryTitleList = ["홈", "추천", "신상품", "베스트", "알뜰쇼핑", "건강관리", "이벤트"]
  
  lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)
  lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBar: pagingTabBar)
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
  }
  
  // MARK: - Functions
  private func setupLayout() {
    [pagingTabBar, pagingView].forEach {
      view.addSubview($0)
    }
    
    pagingTabBar.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(pagingTabBar.cellHeight)
    }
    
    pagingView.snp.makeConstraints {
      $0.top.equalTo(pagingTabBar.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
}
