//
//  PagingCollectionViewCell.swift
//  PagingTabBar
//
//  Created by 윤병일 on 2023/02/06.
//

import UIKit
import SnapKit

class PagingCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Properties
  static let identifier = "PagingCollectionViewCell"
  
  private var contentLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 36.0, weight: .bold)
    label.textAlignment = .center
    label.backgroundColor = [.systemOrange, .systemPurple, .systemCyan, .systemMint, .systemBrown, .systemYellow].randomElement()
    return label
  }()
  
  // MARK: - Functions
  func setupView(title: String) {
    setupLayout()
    contentLabel.text = title
  }
  
  func setupLayout() {
    [contentLabel].forEach { addSubview($0) }
    
    contentLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
