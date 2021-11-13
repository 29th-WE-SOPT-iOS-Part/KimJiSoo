//
//  ViewController.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/06.
//

import UIKit
import SnapKit
import Then

// MARK: - LoginViewController
class LoginViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: - Components
  let logoImageView = UIImageView()
  let loginLabel = UILabel()
  let loginexplainLabel = UILabel()
  let nameTextField = UITextField()
  let nameTextFieldBorderView = UIView()
  let emailTextField = UITextField()
  let emailTextFieldBorderView = UIView()
  let passwordTextField = UITextField()
  let passwordTextFieldBorderView = UIView()
  let createaccountButton = UIButton()
  let nextButton = UIButton()
  var usernameData : String?
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.navigationController?.navigationBar.isHidden = true
    layout()
    setTextField()
  }
  ///TextField 세개에 내용이 모두 찼을 때 버튼이 활성화 되도록
  func setTextField() {
    self.nameTextField.delegate = self
    self.emailTextField.delegate = self
    self.passwordTextField.delegate = self
    nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
  }
  @objc func textFieldDidChange(_ textField: UITextField) {
    if nameTextField.text!.isEmpty || emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
      nextButton.isEnabled = false
      nextButton.backgroundColor = .lightGray
      nextButton.setTitleColor(.white, for: .normal)
    } else {
      nextButton.isEnabled = true
      nextButton.backgroundColor = .blue
      nextButton.setTitleColor(.white, for: .normal)
    }
  }
}
// MARK: - Extension
extension LoginViewController {
  
  // MARK: - Helpers
  func layout() {
    layoutLogoImageView()
    layoutLoginLabel()
    layoutLoginExplainLabel()
    layoutNameTextFieldBorderView()
    layoutNameTextField()
    layoutEmailTextFieldBorderView()
    layoutEmailTextField()
    layoutPasswordTextFieldBorderView()
    layoutPasswordTextField()
    layoutCreateAccountButton()
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
  func layoutLoginLabel() {
    self.view.add(self.loginLabel) {
      $0.setupLabel(text: "로그인", color: .black, font: .notoSansKRMediumFont(fontSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.logoImageView.snp.bottom).offset(23)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutLoginExplainLabel() {
    self.view.add(self.loginexplainLabel) {
      $0.setupLabel(text: "YouTube로 이동하여 계속하세요. 앱 및 Safari\n에서도 Google 서비스에 로그인됩니다.", color: .lightGray, font: .notoSansKRRegularFont(fontSize: 14))
      $0.numberOfLines = 2
      $0.textAlignment = .center
      $0.snp.makeConstraints {
        $0.top.equalTo(self.loginLabel.snp.bottom).offset(14)
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
        $0.top.equalTo(self.loginexplainLabel.snp.bottom).offset(68)
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
        $0.top.equalTo(self.nameTextFieldBorderView.snp.bottom).offset(17)
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
        $0.top.equalTo(self.emailTextFieldBorderView.snp.bottom).offset(17)
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
  func layoutCreateAccountButton() {
    self.view.add(self.createaccountButton) {
      $0.setupButton(title: "계정 만들기", color: .blue, font: .notoSansKRRegularFont(fontSize: 14), backgroundColor: .clear, state: .normal, radius: 0)
      $0.addTarget(self, action: #selector(self.createaccountButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.passwordTextFieldBorderView.snp.bottom).offset(73)
        $0.leading.equalToSuperview().offset(35)
      }
    }
  }
  func layoutNextButton() {
    self.view.add(self.nextButton) {
      $0.setupButton(title: "다음", color: .white, font: .notoSansKRRegularFont(fontSize: 14), backgroundColor: .lightGray, state: .normal, radius: 8)
      $0.addTarget(self, action: #selector(self.nextButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.createaccountButton)
        $0.trailing.equalToSuperview().offset(-35)
        $0.centerY.equalTo(self.createaccountButton)
        $0.width.equalTo(70)
        $0.height.equalTo(38)
      }
    }
  }
  
  // MARK: - General Helpers
  @objc func createaccountButtonClicked() {
    let SignVC = SignupViewController()
    self.navigationController?.pushViewController(SignVC, animated: false)
  }
  @objc func nextButtonClicked() {
    let WelcomeVC = WelcomeViewController()
    WelcomeVC.modalTransitionStyle = .crossDissolve
    WelcomeVC.modalPresentationStyle = .fullScreen
    /// 사용자 데이터 전달
    WelcomeVC.usernameData = nameTextField.text
    /// 버튼이 활성화 되었을 때만 완료 화면으로 넘어가게
    if nextButton.backgroundColor == .blue {
      requestLogin()
      print("클릭")
    }
  }
}

// MARK: - Extensions
extension LoginViewController {
  func presentToWelcomeViewController() {
    let welcomeVC = WelcomeViewController()
    welcomeVC.modalPresentationStyle = .fullScreen
    welcomeVC.usernameData = self.usernameData
    present(welcomeVC, animated: true, completion: nil)
  }
}

// MARK: - Network
extension LoginViewController {
  func requestLogin() {
    LoginUserService.shared.login(email: emailTextField.text ?? "",
                                  password: passwordTextField.text ?? "") { responseData in
      switch responseData {
      case .success(let loginResponse):
        if let data = loginResponse as? LoginResponseDataModel{
          self.simpleAlert(title: "로그인", message: data.message, okAction: { _ in
            self.usernameData = data.data?.name
            self.presentToWelcomeViewController()
          })
        }
      case .requestErr(let message) :
        if let message = message as? String {
          self.simpleAlert(title: "로그인", message: message)
      }
      case.pathErr :
      print("pathERR")
      case .serverErr :
      print("ServerERR")
      case .networkFail:
      print("networkFail")
    }
  }
  
}
}

