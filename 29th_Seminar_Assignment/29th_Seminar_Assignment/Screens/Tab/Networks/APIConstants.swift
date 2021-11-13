//
//  APIConstants.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/11/11.
//

import Foundation
struct APIConstants {
  //MARK : - BASE URL
  static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
  
  //MARK : - Feature URL
  static let userURL = baseURL + "user"
  static let loginURL = baseURL + "/user/login"
  static let readUserURL = baseURL + "/user/signup"
}
