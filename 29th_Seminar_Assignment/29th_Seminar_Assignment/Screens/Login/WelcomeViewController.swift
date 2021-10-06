//
//  WelcomeViewController.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/06.
//

import UIKit
import SnapKit
import Then

// MARK: - WelcomeViewController
class WelcomeViewController: UIViewController {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  let usernameLabel = UILabel()
  let confirmButton = UIButton()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.navigationController?.navigationBar.isHidden = true
    layout()
  }
}

// MARK: - Extension
extension WelcomeViewController {
  
  //MARK: - Helpers
  func layout() {
    layoutLogoImageView()
    layoutUserNameLabel()
    layoutConfirmButton()
  }
  func layoutLogoImageView() {
    self.view.add(self.logoImageView) {
      $0.image = UIImage(named: "GoogleLogo")
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(250)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(120)
        $0.height.equalTo(40)
      }
    }
  }
  func layoutUserNameLabel() {
    self.view.add(self.usernameLabel) {
      $0.setupLabel(text: "000님\n환영합니다", color: .black, font: .notoSansKRMediumFont(fontSize: 24))
      $0.numberOfLines = 2
      $0.textAlignment = .center
      $0.snp.makeConstraints {
        $0.top.equalTo(self.logoImageView.snp.bottom).offset(20)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutConfirmButton() {
    self.view.add(self.confirmButton) {
      $0.setupButton(title: "확인", color: .white, font: .notoSansKRRegularFont(fontSize: 18), backgroundColor: .blue, state: .normal, radius: 10)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.usernameLabel.snp.bottom).offset(40)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(315)
        $0.height.equalTo(50)
      }
    }
  }
}
