//
//  PagingTabBarCell.swift
//  PagingTabBar
//
//  Created by 윤병일 on 2023/02/01.
//

import UIKit
import SnapKit

class PagingTabBarCell : UICollectionViewCell {
  
  // MARK: - Properties
  static let identifier = "PagingTabBarCell"
  
  private lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0, weight: .semibold)
    label.textColor = .lightGray
    label.textAlignment = .center
    return label
  }()
  
  private lazy var underLine : UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    view.alpha = 0.0
    return view
  }()
  
  override var isSelected: Bool {
    // 셀이 선택 되었을 때 설정
    didSet {
      titleLabel.textColor = isSelected ? .systemBlue : .lightGray
      underLine.alpha = isSelected ? 1.0 : 0.0
    }
  }
  
  // MARK: - Functions
  
  func setupView(title : String) {
    setupLayout()
    titleLabel.text = title
  }
  
  func setupLayout() {
    [titleLabel, underLine].forEach {
      addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    
    underLine.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(3.0)
    }
  }
  
}
