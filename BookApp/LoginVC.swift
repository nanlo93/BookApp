//
//  loginVC.swift
//  BookApp
//
//  Created by Shin on 03/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class LoginVC: UIViewController {
    
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfPw: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        //id와 pw 레이블에 입력된 값 가져오기
        let id = tfId.text
        let pw = tfPw.text
        print("아이디 : \(id!) \(id!.count), 비밀번호 : \(pw!) \(pw!.count)")
        // 화면을 전환할 뷰 컨트롤러 객체를 스토리보드에서 Storyboard ID 정보를 이용하여 읽어온다
        
        if let login = self.storyboard?.instantiateViewController(withIdentifier: "Tabbar") {
            // 화면을 전환할 때 애니메이션 정의
            login.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            // 인자값으로 받은 뷰 컨트롤러로 화면 이동
            self.present(login, animated: true, completion: nil)
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
