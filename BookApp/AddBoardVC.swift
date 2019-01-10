//
//  AddBoardVC.swift
//  BookApp
//
//  Created by Shin on 08/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class AddBoardVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var tvContent: UITextView!
    
    @IBAction func btnSaveClick(_ sender: Any) {
        //        이전 화면으로 되돌아가기
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfTitle.delegate = self
        tvContent.delegate = self
        
        tfTitle.layer.cornerRadius = 5
        tfTitle.layer.borderWidth = 0.5
        tfTitle.layer.borderColor = UIColor.black.cgColor
        
        tvContent.layer.cornerRadius = 5
        tvContent.layer.borderWidth = 0.5
        tvContent.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    //키보드가 올라온 상태에서 화면을 터치해서 키보드 가리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.view.frame.origin.y = -100
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.frame.origin.y = 0
    }
    
    //return 버튼으로 다음 textfield 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = self.tvContent.tag
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
