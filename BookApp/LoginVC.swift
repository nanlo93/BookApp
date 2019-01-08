//
//  loginVC.swift
//  BookApp
//
//  Created by Shin on 03/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfPw: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        //id와 pw 레이블에 입력된 값 가져오기
        let id = tfId.text
        let pw = tfPw.text
        print("아이디 : \(id!) \(id!.count), 비밀번호 : \(pw!) \(pw!.count)")
        // 화면을 전환할 뷰 컨트롤러 객체를 스토리보드에서 Storyboard ID 정보를 이용하여 읽어온다
        
        //로그인 성공시
        //메인 화면으로 이동
        if let main = self.storyboard?.instantiateViewController(withIdentifier: "Tabbar") {
            // 화면을 전환할 때 애니메이션 정의
            main.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            // 인자값으로 받은 뷰 컨트롤러로 화면 이동
            self.present(main, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        if let signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") {
            // 화면을 전환할 때 애니메이션 정의
            signUp.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            // 인자값으로 받은 뷰 컨트롤러로 화면 이동
            self.present(signUp, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfId.delegate = self
        tfPw.delegate = self
        
        print("test")
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
