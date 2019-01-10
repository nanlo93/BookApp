//
//  mainVC.swift
//  BookApp
//
//  Created by Shin on 04/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class MainVC: UIViewController {
    
    var maxEntry : Int?
    var entry : Int?
    
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var lblFee: UILabel!
    @IBOutlet weak var lblEntryCount: UILabel!
    @IBOutlet weak var btnEntry: UIButton!
    
    @IBAction func btnEntryClicked(_ sender: Any) {
        entry? += 1
        lblEntryCount.text = "\(entry!)/\(maxEntry!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entry = 10
        maxEntry = 15
        lblEntryCount.text = "\(entry!)/\(maxEntry!)"
        lblBookTitle.text = "삶의 보람에 대하여"
        lblBookAuthor.text = "가미야 메이코"
        lblPlace.text = "구산동 도서관 마을"
        lblFee.text = "10000원"        

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
