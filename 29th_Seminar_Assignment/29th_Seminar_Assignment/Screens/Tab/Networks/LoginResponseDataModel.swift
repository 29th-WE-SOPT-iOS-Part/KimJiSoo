//
//  LoginResponseDataModel.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/11/11.
//

import Foundation

// MARK: - LoginResponseDataModel
struct LoginResponseDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginReseultData?
}

// MARK: - LoginReseultData
struct LoginReseultData: Codable {
    let id: Int
    let name, email: String
}
