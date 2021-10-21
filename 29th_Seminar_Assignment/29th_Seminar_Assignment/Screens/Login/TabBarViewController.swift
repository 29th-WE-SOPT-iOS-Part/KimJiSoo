//
//  TabBarViewController.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/21.
//

import UIKit

// MARK : TabBarViewController
class TabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    setTabBar()
    tabBarUI()
  }
}

extension TabBarViewController {
  func tabBarUI() {
    UITabBar.appearance().tintColor = UIColor.black
  }
  
  func setTabBar() {
    let firstVC = FirstTabViewController()
    firstVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
    
    let secondVC = SecondTabViewController()
    secondVC.tabBarItem = UITabBarItem(title: "shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))
    
    let thirdVC = ThirdTabViewController()
    thirdVC.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plueCircleIcon"), selectedImage: UIImage(named: "plueCircleIcon"))
    
    let fourthVC = FourthTabViewController()
    fourthVC.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
    
    let fifthVC = FifthTabViewController()
    fifthVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
    
    let TabVC = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    self.setViewControllers(TabVC, animated: false)
    self.selectedViewController = firstVC
  }
}
