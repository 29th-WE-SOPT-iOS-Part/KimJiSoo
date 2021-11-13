//
//  NetworkResults.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/11/11.
//

import Foundation
enum NetworkResult<T> {
  case success(T)
  case requestErr(T)
  case pathErr
  case serverErr
  case networkFail
}
