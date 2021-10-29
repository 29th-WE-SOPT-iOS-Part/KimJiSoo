//
//  ShortsListModel.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/10/29.
//

import UIKit

// MARK: - ShortsListModel
struct ShortsListModel: Codable {
  let profile: String
  let profileImageName: String
  
  func makeImage() -> UIImage? {
    return UIImage(named: profileImageName)
  }
}
