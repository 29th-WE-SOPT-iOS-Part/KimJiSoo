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
  let explainusernameLabel = UILabel()
  let confirmButton = UIButton()
  let anotherAccountButton = UIButton()
  var usernameData : String?
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.navigationController?.navigationBar.isHidden = true
    layout()
    setNameinLabel()
  }
  ///사용자 이름 데이터 받아오기
  func setNameinLabel() {
    if let name = usernameData {
      usernameLabel.text = "\(name)님"
      usernameLabel.sizeToFit()
    }
  }
}

// MARK: - Extension
extension WelcomeViewController {
  
  //MARK: - Helpers
  func layout() {
    layoutLogoImageView()
    layoutUserNameLabel()
    layoutExplainUserNameLabel()
    layoutConfirmButton()
    layoutAnotherAccountButton()
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
      $0.setupLabel(text: "", color: .black, font: .notoSansKRMediumFont(fontSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.logoImageView.snp.bottom).offset(23)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainUserNameLabel() {
    self.view.add(self.explainusernameLabel) {
      $0.setupLabel(text: "환영합니다", color: .black, font: .notoSansKRRegularFont(fontSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.usernameLabel.snp.bottom).offset(3)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutConfirmButton() {
    self.view.add(self.confirmButton) {
      $0.setupButton(title: "확인", color: .white, font: .notoSansKRRegularFont(fontSize: 18), backgroundColor: .blue, state: .normal, radius: 10)
      $0.addTarget(self, action: #selector(self.confirmButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.explainusernameLabel.snp.bottom).offset(53)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(315)
        $0.height.equalTo(50)
      }
    }
  }
  func layoutAnotherAccountButton() {
    self.view.add(self.anotherAccountButton) {
      $0.setupButton(title: "다른 계정으로 로그인하기", color: .blue, font: .notoSansKRRegularFont(fontSize: 14), backgroundColor: .clear, state: .normal, radius: 0)
      $0.addTarget(self, action: #selector(self.anotherAccountButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.confirmButton.snp.bottom).offset(23)
        $0.centerX.equalToSuperview()
      }
    }
  }
  @objc func confirmButtonClicked() {
    let TabbarVC = TabBarViewController()
    TabbarVC.modalTransitionStyle = .crossDissolve
    TabbarVC.modalPresentationStyle = .fullScreen
    self.present(TabbarVC, animated: true, completion: nil)
  }
  
  @objc func anotherAccountButtonClicked() {
    guard let parentVC = presentingViewController as? UINavigationController else { return }
    self.dismiss(animated: true) {
      parentVC.popToRootViewController(animated: true)
    }
  }
}
