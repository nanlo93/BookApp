//
//  SignUpVC.swift
//  BookApp
//
//  Created by Shin on 04/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate {
    //id, pw 길이 제한
    let limitLengthIDxPW = 20
    let limitLengthPhone = 11
    let limitLengthBirthday = 8
    
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfPw: UITextField!
    @IBOutlet weak var tfPwCheck: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfBirthday: UITextField!
    
    @IBAction func btnSignUp(_ sender: Any) {
        if tfPw.text == tfPwCheck.text {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
//        이전 화면으로 되돌아가기
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfId.delegate = self
        tfPw.delegate = self
        tfPwCheck.delegate = self
        tfPhone.delegate = self
        tfBirthday.delegate = self
    }
    
    //id와 pw 입력을 최대 20자로 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        switch textField.placeholder! {
        case "아이디":
            fallthrough
        case "비밀번호":
            fallthrough
        case "비밀번호 확인":
            return newLength <= 20
        case "전화번호":
            return newLength <= 11
        case "생일":
            return newLength <= 8
        default:
            return false
        }
//        return newLength <= limitLengthIDxPW
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
