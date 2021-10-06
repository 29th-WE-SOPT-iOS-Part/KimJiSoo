//
//  SignupViewController.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/06.
//

import UIKit
import SnapKit
import Then

// MARK: - SignupViewController
class SignupViewController: UIViewController {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  let signupLabel = UILabel()
  let nameTextFieldBorderView = UIView()
  let nameTextField = UITextField()
  let emailTextFieldBorderView = UIView()
  let emailTextField = UITextField()
  let passwordTextFieldBorderView = UIView()
  let passwordTextField = UITextField()
  let showpasswordButton = UIButton()
  let showpasswordLabel = UILabel()
  let nextButton = UIButton()
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.navigationController?.navigationBar.isHidden = true
    layout()
  }
  
}

// MARK: - Extension
extension SignupViewController {
  
  // MARK: - Helpers
  func layout() {
    layoutLogoImageView()
    layoutSignupLabel()
    layoutNameTextFieldBorderView()
    layoutNameTextField()
    layoutEmailTextFieldBorderView()
    layoutEmailTextField()
    layoutPasswordTextFieldBorderView()
    layoutPasswordTextField()
    layoutShowPasswordButton()
    layoutShowPasswordLabel()
    layoutNextButton()
  }
  func layoutLogoImageView() {
    self.view.add(self.logoImageView) {
      $0.image = UIImage(named: "GoogleLogo")
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(80)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(120)
        $0.height.equalTo(40)
      }
    }
  }
  func layoutSignupLabel() {
    self.view.add(self.signupLabel) {
      $0.setupLabel(text: "회원가입", color: .black, font: .notoSansKRMediumFont(fontSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.logoImageView.snp.bottom).offset(20)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutNameTextFieldBorderView() {
    self.view.add(self.nameTextFieldBorderView) {
      $0.borderWidth = 1
      $0.borderColor = .lightGray
      $0.setRounded(radius: 5)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.signupLabel.snp.bottom).offset(110)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(315)
        $0.height.equalTo(50)
      }
    }
  }
  func layoutNameTextField() {
    self.nameTextFieldBorderView.add(self.nameTextField) {
      $0.configureTextField(textColor: .black, font: UIFont.notoSansKRRegularFont(fontSize: 14))
      $0.attributedPlaceholder = NSAttributedString(string: "이름을 입력해주세요",
                                                    attributes: [NSAttributedString.Key.font: UIFont.notoSansKRRegularFont(fontSize: 14),
                                                                 NSAttributedString.Key.foregroundColor: UIColor.lightGray])
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.nameTextFieldBorderView)
        $0.leading.equalTo(self.nameTextFieldBorderView.snp.leading).offset(8)
      }
    }
  }
  func layoutEmailTextFieldBorderView() {
    self.view.add(self.emailTextFieldBorderView) {
      $0.borderWidth = 1
      $0.borderColor = .lightGray
      $0.setRounded(radius: 5)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.nameTextFieldBorderView.snp.bottom).offset(12)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(315)
        $0.height.equalTo(50)
      }
    }
  }
  func layoutEmailTextField() {
    self.emailTextFieldBorderView.add(self.emailTextField) {
      $0.configureTextField(textColor: .black, font: UIFont.notoSansKRRegularFont(fontSize: 14))
      $0.attributedPlaceholder = NSAttributedString(string: "이메일 또는 휴대전화",
                                                    attributes: [NSAttributedString.Key.font: UIFont.notoSansKRRegularFont(fontSize: 14),
                                                                 NSAttributedString.Key.foregroundColor: UIColor.lightGray])
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.emailTextFieldBorderView)
        $0.leading.equalTo(self.emailTextFieldBorderView.snp.leading).offset(8)
      }
    }
  }
  func layoutPasswordTextFieldBorderView() {
    self.view.add(self.passwordTextFieldBorderView) {
      $0.borderWidth = 1
      $0.borderColor = .lightGray
      $0.setRounded(radius: 5)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.emailTextFieldBorderView.snp.bottom).offset(12)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(315)
        $0.height.equalTo(50)
      }
    }
  }
  func layoutPasswordTextField() {
    self.passwordTextFieldBorderView.add(self.passwordTextField) {
      $0.configureTextField(textColor: .black, font: UIFont.notoSansKRRegularFont(fontSize: 14))
      $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요",
                                                    attributes: [NSAttributedString.Key.font: UIFont.notoSansKRRegularFont(fontSize: 14),
                                                                 NSAttributedString.Key.foregroundColor: UIColor.lightGray])
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.passwordTextFieldBorderView)
        $0.leading.equalTo(self.passwordTextFieldBorderView.snp.leading).offset(8)
      }
    }
  }
  func layoutShowPasswordButton() {
    self.view.add(showpasswordButton) {
      $0.borderWidth = 1
      $0.borderColor = .lightGray
      $0.setImage(UIImage(contentsOfFile: ""), for: .normal)
      $0.setImage(UIImage(contentsOfFile: ""), for: .selected)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.passwordTextFieldBorderView.snp.bottom).offset(15)
        $0.leading.equalTo(self.passwordTextFieldBorderView.snp.leading)
        $0.width.equalTo(15)
        $0.height.equalTo(15)
      }
    }
  }
  func layoutShowPasswordLabel() {
    self.view.add(self.showpasswordLabel) {
      $0.setupLabel(text: "비밀번호 표시", color: .black, font: .notoSansKRRegularFont(fontSize: 12))
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.showpasswordButton)
        $0.leading.equalTo(self.showpasswordButton.snp.trailing).offset(10)
      }
    }
  }
  func layoutNextButton() {
    self.view.add(self.nextButton) {
      $0.setupButton(title: "다음", color: .white, font: .notoSansKRRegularFont(fontSize: 18), backgroundColor: .blue, state: .normal, radius: 10)
      $0.addTarget(self, action: #selector(self.nextButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.showpasswordLabel.snp.bottom).offset(40)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(315)
        $0.height.equalTo(50)
      }
    }
  }
  // MARK: - General Helpers
  @objc func nextButtonClicked() {
    let WelcomeVC = WelcomeViewController()
    WelcomeVC.modalTransitionStyle = .crossDissolve
    WelcomeVC.modalPresentationStyle = .fullScreen
    self.present(WelcomeVC, animated: true, completion: nil)
  }
}
