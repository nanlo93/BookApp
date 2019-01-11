//
//  HistoryVC.swift
//  BookApp
//
//  Created by Shin on 04/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class HistoryVC: UIViewController {

    @IBAction func btnAdd(_ sender: Any) {
        //memberLevel이 운영진이면 화면 전환
        //일반회원이면 경고창 출력
        if let add = self.storyboard?.instantiateViewController(withIdentifier: "AddEventVC"){
            add.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(add, animated: true, completion: nil)
        }
//        let alert = UIAlertController(title: "일반회원은 모임 일정을 등록할 수 없습니다.", message: nil, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "확인", style: .cancel)
//        alert.addAction(ok)
//        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("역대 도서 목록 화면 재출력")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        print("viewWillAppear 출력")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //키보드가 올라온 상태에서 화면을 터치해서 키보드 가리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
