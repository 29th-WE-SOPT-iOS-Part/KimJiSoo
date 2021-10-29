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
  var videoList : [VideoModel] = []
  var shortsList : [ShortsListModel] = []
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
    self.shortsCollectionView.delegate = self
    self.shortsCollectionView.dataSource = self
    self.videoTableView.delegate = self
    self.videoTableView.dataSource = self
    layout()
    register()
    setVideoList()
    setShortsList()
  }
  func setVideoList() {
    videoList.append(contentsOf: [
      VideoModel(explain: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode\n 기본 사용법, View 화면전환",
                 info: "WE SOPT ・조회수 100만회 ・ 5주 전"),
      VideoModel(explain: "2차 iOS 세미나 : AutoLayout, StackView,\n TabBarController",
                 info: "WE SOPT ・조회수 100만회 ・ 4주 전"),
      VideoModel(explain: "3차 iOS 세미나 : ScrollView, Delegate\n Pattern, TableView, CollectionView",
                 info: "WE SOPT ・조회수 100만회 ・ 3주 전"),
      VideoModel(explain: "4차 iOS 세미나 : Cocoapods & Networking,\n REST API",
                 info: "WE SOPT ・조회수 100만회 ・ 3주 전"),
      VideoModel(explain: "7차 iOS 세미나 : Animation과 제스쳐, 데이\n터 전달 심화 ",
                 info: "WE SOPT ・조회수 100만회 ・ 2주 전"),
      VideoModel(explain: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode\n 기본 사용법, View 화면전환",
                 info: "WE SOPT ・조회수 100만회 ・ 1주 전")
    ])
  }
  func setShortsList() {
    shortsList.append(contentsOf: [
      ShortsListModel(profile: "iOS Part"),
      ShortsListModel(profile: "Android Part"),
      ShortsListModel(profile: "Server Part"),
      ShortsListModel(profile: "Plan Part"),
      ShortsListModel(profile: "Design Part"),
      ShortsListModel(profile: "iOS Part"),
    ])
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
      $0.backgroundColor = .white
      $0.showsHorizontalScrollIndicator = false
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
      self.videoTableView.rowHeight = 306
      $0.backgroundColor = .white
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.separatorStyle = .none
      $0.snp.makeConstraints {
        $0.top.equalTo(self.shortsCollectionView.snp.bottom)
        $0.leading.equalTo(self.mainScrollContainerView.snp.leading)
        $0.trailing.equalTo(self.mainScrollContainerView.snp.trailing)
        $0.bottom.equalTo(self.mainScrollContainerView.snp.bottom)
        $0.height.equalTo(1850)
      }
    }
  }
}

extension FirstTabViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 306
  }
}
extension FirstTabViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let videoCell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier, for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
    videoCell.setData(explain: videoList[indexPath.row].explain,
                      info: videoList[indexPath.row].info)
    videoCell.awakeFromNib()
    return videoCell
  }
}

extension FirstTabViewController : UICollectionViewDelegate {
}
extension FirstTabViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let shortsCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else {return UICollectionViewCell() }
    shortsCell.setData(profile: shortsList[indexPath.row].profile)
    shortsCell.awakeFromNib()
    return shortsCell
  }
}

extension FirstTabViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = 72
    let cellHeight = 104
    
    return CGSize(width: cellWidth, height: cellHeight)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
