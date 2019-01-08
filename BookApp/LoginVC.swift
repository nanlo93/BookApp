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
    //로그인 여부를 저장할 데이터베이스 파일 경로를 저장할 변수
    var dbPath : String?
    
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
        
        //데이터베이스 파일의 경로 생성
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docPath = dirPaths[0] as String
        dbPath = docPath.appending("/contact.sqlite")
        
        //파일의 존재여부 확인
        if !fileMgr.fileExists(atPath: dbPath!){
            //파일을 생성
            let contactDB = FMDatabase(path: dbPath)
            //데이터베이스 열기
            if contactDB.open(){
                //                let sql = "create table contacts(id integer primary key autoincrement, name text, phone text, address text)"
                //로그인시 1, 로그아웃시 0 저장 예정
                let sql = "CREATE TABLE LOGINCHECK(loginState INTEGER PRIMARY KEY DEFAULT 1 NOT NULL)"
                if !contactDB.executeStatements(sql){
                    //테이블 생성 실패
                    print("테이블 생성 실패")
                    //                    status.text = "테이블 생성 실패"
                }
                contactDB.close()
            }else{
                //데이터베이스 열기 실패
                print("데이터베이스 열기 실패")
                //                status.text = "데이터베이스 열기 실패"
            }
        }else{
            //파일이 존재
            print("파일이 존재")
            //            status.text = "파일이 존재"
        }
        
        //로그인 여부 확인 - 기존에 로그인 했을시 바로 메인 페이지로 이동
        //데이터베이스 열기
        let contactDB = FMDatabase(path: dbPath!)
        if contactDB.open(){
            print("select문 실행 직전")
            do{
                //테이블의 모든 데이터를 가져오는 SQL을 생성
                let sql = "SELECT loginState FROM LOGINCHECK"
                print("select문 실행 직후")
                //select 구문은 ResultSet으로 받아야 합니다.
                let result = try contactDB.executeQuery(sql, values:[])
                while result.next() {
                    print("if문 진입 직후")
                    //                txtName!.text = results!.string(forColumn: "name")
                    //                txtPhone!.text = results!.string(forColumn: "phone")
                    //                txtAddress!.text = results!.string(forColumn: "address")
                    let loginState = result.int(forColumn: "loginState")
                    print("loginState 값 : \(loginState)")
                    if loginState == 1{
                        print("자동화면전환직전도달")
                        //메인 화면으로 이동
                        if let main = self.storyboard?.instantiateViewController(withIdentifier: "Tabbar") {
                            // 화면을 전환할 때 애니메이션 정의
                            main.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                            // 인자값으로 받은 뷰 컨트롤러로 화면 이동
                            self.present(main, animated: true, completion: nil)
                        }
                    }
                }
            } catch let error as NSError{
                print("에러 : \(error.localizedDescription)")
            }
            contactDB.close()
        }else{
            print("데이터베이스 열기 실패")
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
