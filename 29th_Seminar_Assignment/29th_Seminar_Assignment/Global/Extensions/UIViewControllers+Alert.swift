//
//  UIViewControllers.swift
//  29th_Seminar_Assignment
//
//  Created by 김지수 on 2021/11/11.
//

import UIKit

extension UIViewController {
    // 현규선배 코드..냠냠합니다..감사합니다:)
    func simpleAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> ())? = nil)
    {
        // creates haptics to simulate physical impacts.
        let generator = UIImpactFeedbackGenerator(style: .medium)
        // triggers impoact feedback.
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
