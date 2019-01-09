//
//  AddBoardVC.swift
//  BookApp
//
//  Created by Shin on 08/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit

class AddBoardVC: UIViewController {

    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var tvContent: UITextView!
    
    @IBAction func btnSaveClick(_ sender: Any) {
        //        이전 화면으로 되돌아가기
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        tfTitle.layer.cornerRadius = 5
        tfTitle.layer.borderWidth = 0.5
        tfTitle.layer.borderColor = UIColor.black.cgColor
        
        tvContent.layer.cornerRadius = 5
        tvContent.layer.borderWidth = 0.5
        tvContent.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
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
