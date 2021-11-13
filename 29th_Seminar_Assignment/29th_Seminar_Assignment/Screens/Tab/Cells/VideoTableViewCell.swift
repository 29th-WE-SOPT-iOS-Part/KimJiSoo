//
//  VideoTableViewCell.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/29.
//

import UIKit

import SnapKit
import Then

// MARK: - VideoTableViewCell
class VideoTableViewCell: UITableViewCell {
  
  // MARK: - Components
  let thumnailImageView = UIImageView()
  let profileImageView = UIImageView()
  let explainLabel = UILabel()
  let informationLabel = UILabel()
  let showmoreButton = UIButton()
    
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = .clear
    layout()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    self.selectionStyle = .none
  }
  func setData(explain: String,
               info: String)
  {
    explainLabel.text = explain
    informationLabel.text = info
  }
  
}
// MARK: - Extensions
extension VideoTableViewCell {
  func layout() {
    contentView.backgroundColor = .white
    contentView.cornerRadius = 0
    layoutThumbnailImageView()
    layoutProfileImageView()
    layoutExplainLabel()
    layoutInformationLabel()
    layoutShowMoreButton()
  }
  func layoutThumbnailImageView() {
    self.contentView.add(thumnailImageView) {
      $0.image = UIImage(named: "wesoptiOSPart")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.top)
        $0.leading.equalTo(self.contentView.snp.leading)
        $0.trailing.equalTo(self.contentView.snp.trailing)
        $0.height.equalTo(212)
      }
    }
  }
  func layoutProfileImageView() {
    self.contentView.add(profileImageView) {
      $0.image = UIImage(named: "wesoptProfile")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.thumnailImageView.snp.bottom).offset(12)
        $0.leading.equalTo(self.contentView.snp.leading).offset(12)
        $0.height.equalTo(36)
        $0.width.equalTo(36)
      }
    }
  }
  func layoutExplainLabel() {
    self.contentView.add(explainLabel) {
      self.explainLabel.textColor = .black
      self.explainLabel.font = .notoSansKRRegularFont(fontSize: 15)
      $0.numberOfLines = 2
      $0.textAlignment = .left
      $0.snp.makeConstraints {
        $0.top.equalTo(self.thumnailImageView.snp.bottom).offset(12)
        $0.leading.equalTo(self.profileImageView.snp.trailing).offset(11)
      }
    }
  }
  func layoutInformationLabel() {
    self.contentView.add(informationLabel) {
      self.informationLabel.textColor = .lightGray
      self.informationLabel.font = .notoSansKRRegularFont(fontSize: 13)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.explainLabel.snp.bottom).offset(4)
        $0.leading.equalTo(self.explainLabel.snp.leading)
      }
    }
  }
  func layoutShowMoreButton() {
    self.contentView.add(showmoreButton) {
      $0.setImage(UIImage(named: "moreMenuIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.thumnailImageView.snp.bottom).offset(7)
        $0.trailing.equalTo(self.contentView.snp.trailing)
        $0.height.equalTo(26)
        $0.width.equalTo(26)
      }
    }
  }
}
