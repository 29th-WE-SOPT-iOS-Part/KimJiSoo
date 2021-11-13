//
//  LoginUserService.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/11/11.
//

import Foundation
import Alamofire

struct LoginUserService {
  static let shared = LoginUserService()
  
  func login(email: String,
             password: String,
             completion: @escaping (NetworkResult<Any>) -> (Void)) {
    let url = APIConstants.loginURL
    let header: HTTPHeaders = [
      "Content-Type" : "application/json"
    ]
    let body : Parameters = [
      "email" : email,
      "password" : password
    ]
    let dataRequest = AF.request(url,
                                 method: .post,
                                 parameters: body,
                                 encoding: JSONEncoding.default,
                                 headers: header)
    dataRequest.responseData { DataResponse in
      switch DataResponse.result {
      case .success :
        guard let statusCode = DataResponse.response?.statusCode else {return}
        guard let value = DataResponse.value else {return}
        let networkResult = self.judgeLoginStatus(by: statusCode, value)
        completion(networkResult)
      case .failure(let err) :
        print(err)
        completion(.networkFail)
      }
    }
  }
  func readUserData(userID : Int,
                    ompletion: @escaping (NetworkResult<Any>) -> (Void)) {
    let url = APIConstants.readUserURL + "\(userID)"
    let header: HTTPHeaders = [
      "Content-Type" : "application/json"
    ]
    let dataRequest = AF.request(url,
                                 method: .get,
                                 encoding: JSONEncoding.default,
                                 headers: header)
  }
  private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    switch statusCode {
    case 200 : return isValidLoginData(data: data)
    case 400 : return isValidLoginData(data: data)
    case 500 : return .serverErr
    default : return .networkFail
    }
  }
  private func isValidLoginData(data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodeData = try? decoder.decode(LoginResponseDataModel.self, from: data)
    else {return .pathErr}
    return .success(decodeData)
  }
}
