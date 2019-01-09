//
//  SignUpVC.swift
//  BookApp
//
//  Created by Shin on 04/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class SignUpVC: UIViewController, UITextFieldDelegate {
    //입력길이제한에 필요한 상수 초기화
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
        } else if tfPw.text != tfPwCheck.text {
            let alert = UIAlertController(title: "비밀번호가 일치하지 않습니다.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: true)
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    @objc func keyboardWillShow(_ sender:Notification){
        self.view.frame.origin.y = -140
    }
    
    @objc func keyboardWillHide(_ sender:Notification){
        self.view.frame.origin.y = 0
    }
    
    //id와 pw 입력을 최대 20자로 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        switch textField.placeholder! {
        case "아이디 20자이내":
            return newLength <= limitLengthIDxPW
        case "비밀번호 20자이내":
            return newLength <= limitLengthIDxPW
        case "비밀번호 확인":
            return newLength <= limitLengthIDxPW
        case "전화번호 11자이내":
            return newLength <= limitLengthPhone
        case "생년월일 8자":
            return newLength <= limitLengthBirthday
        default:
            return false
        }
    }
    
    //키보드가 올라온 상태에서 화면을 터치해서 키보드 가리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //return 버튼으로 다음 textfield 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
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
