//
//  OrangeViewController.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/21.
//

import UIKit

import SnapKit
import Then

// MARK: - FirstTabViewController
class FirstTabViewController: UIViewController {
  
  // MARK: - Components
  let mainScrollView = UIScrollView()
  let mainScrollContainerView = UIView()
  let menuContainerView = UIView()
  let youtubeLogoImage = UIImageView()
  let videoIcon = UIButton()
  let alarmIcon = UIButton()
  let searchIcon = UIButton()
  let profileIcon = UIButton()
  let shortsCollectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.isPagingEnabled = true
    return collectionView
  }()
  let videoTableView = UITableView()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
//    self.shortsCollectionView.delegate = self
//    self.shortsCollectionView.dataSource = self
//    self.videoTableView.delegate = self
//    self.videoTableView.dataSource = self
    layout()
    register()
  }
}
// MARK: - Extension
extension FirstTabViewController {
  
  // MARK: - Helpers
  func register() {
    self.videoTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: VideoTableViewCell.identifier)
    self.shortsCollectionView.register(ShortsCollectionViewCell.self, forCellWithReuseIdentifier: ShortsCollectionViewCell.identifier)
  }
  func layout() {
    layoutMainScrollView()
    layoutMainScrollContainerView()
    layoutmenuContainerView()
    layoutYoutubeLogoImage()
    layoutVideoIcon()
    layoutAlarmIcon()
    layoutSearchIcon()
    layoutProfileIcon()
    layoutShortsCollectionView()
    layoutVideoTableView()
  }
  func layoutMainScrollView() {
    self.view.add(mainScrollView) {
      $0.backgroundColor = .white
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.showsVerticalScrollIndicator = false
      $0.isScrollEnabled = true
      $0.snp.makeConstraints {
        $0.center.top.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
  func layoutMainScrollContainerView() {
    self.mainScrollView.add(mainScrollContainerView) {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .clear
      $0.contentMode = .scaleToFill
      $0.snp.makeConstraints {
        $0.centerX.top.leading.equalToSuperview()
        $0.bottom.equalTo(self.mainScrollView.snp.bottom)
      }
    }
  }
  func layoutmenuContainerView() {
    self.mainScrollContainerView.add(menuContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalToSuperview()
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(44)
      }
    }
  }
  func layoutYoutubeLogoImage() {
    self.menuContainerView.add(youtubeLogoImage) {
      $0.image = UIImage(named: "premiumLogo")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.menuContainerView.snp.top).offset(11)
        $0.leading.equalTo(self.menuContainerView.snp.leading).offset(16)
      }
    }
  }
  func layoutVideoIcon() {
    self.menuContainerView.add(videoIcon) {
      $0.setImage(UIImage(named: "windowSharingIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.menuContainerView)
        $0.leading.equalTo(self.youtubeLogoImage.snp.trailing).offset(87)
        $0.height.equalTo(32)
        $0.width.equalTo(32)
      }
    }
  }
  func layoutAlarmIcon() {
    self.menuContainerView.add(alarmIcon) {
      $0.setImage(UIImage(named: "notificationIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.menuContainerView)
        $0.leading.equalTo(self.videoIcon.snp.trailing).offset(12)
        $0.height.equalTo(32)
        $0.width.equalTo(32)
      }
    }
  }
  func layoutSearchIcon() {
    self.menuContainerView.add(searchIcon) {
      $0.setImage(UIImage(named: "SearchIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.menuContainerView)
        $0.leading.equalTo(self.alarmIcon.snp.trailing).offset(11)
        $0.height.equalTo(32)
        $0.width.equalTo(32)
      }
    }
  }
  func layoutProfileIcon() {
    self.menuContainerView.add(profileIcon) {
      $0.setImage(UIImage(named: "wesoptProfile"), for: .normal)
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.menuContainerView)
        $0.leading.equalTo(self.searchIcon.snp.trailing).offset(17)
        $0.height.equalTo(24)
        $0.width.equalTo(24)
      }
    }
  }
  func layoutShortsCollectionView() {
    self.mainScrollContainerView.add(shortsCollectionView) {
      $0.backgroundColor = .orange
      $0.snp.makeConstraints {
        $0.top.equalTo(self.menuContainerView.snp.bottom)
        $0.height.equalTo(104)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
      }
    }
  }
  func layoutVideoTableView() {
    self.mainScrollContainerView.add(videoTableView) {
      $0.backgroundColor = .blue
      $0.estimatedRowHeight = 306
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.separatorStyle = .none
      $0.snp.makeConstraints {
        $0.top.equalTo(self.shortsCollectionView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.bottom.equalTo(self.mainScrollContainerView.snp.bottom)
        $0.height.equalTo(2000)
      }
    }
  }
}
//
//extension FirstTabViewController : UITableViewDelegate {
//}
//extension FirstTabViewController : UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    <#code#>
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    <#code#>
//  }
//}
//
//extension FirstTabViewController : UICollectionViewDelegate {
//}
//extension FirstTabViewController : UICollectionViewDataSource {
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    <#code#>
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    <#code#>
//  }
//
//
//}
