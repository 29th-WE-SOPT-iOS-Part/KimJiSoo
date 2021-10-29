//
//  ShortsCollectionViewCell.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/29.
//

import UIKit

import SnapKit
import Then

// MARK: - ShortsCollectionViewCell
class ShortsCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let shortsImageView = UIImageView()
  let profileLabel = UILabel()
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  func setData(profile: String)
  {
    profileLabel.text = profile
  }
}

// MARK: - Extension
extension ShortsCollectionViewCell {
  func layout() {
    layoutShortsImageView()
    layoutProfileLabel()
  }
  func layoutShortsImageView() {
    self.contentView.add(shortsImageView) {
      $0.image = UIImage(named: "ggamju1")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.top).offset(14)
        $0.centerX.equalTo(self.contentView.snp.centerX)
        $0.height.equalTo(58)
        $0.width.equalTo(58)
      }
    }
  }
  func layoutProfileLabel() {
    self.contentView.add(profileLabel) {
      self.profileLabel.textColor = .gray
      self.profileLabel.font = .notoSansKRRegularFont(fontSize: 12)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.shortsImageView.snp.bottom).offset(5)
        $0.centerX.equalTo(self.shortsImageView)
      }
    }
  }
}

