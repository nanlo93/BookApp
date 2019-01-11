//
//  BoardVC.swift
//  BookApp
//
//  Created by Shin on 04/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit
import Alamofire    //URL 통신을 쉽게 할 수 있도록 해주는 외부 라이브러리

class BoardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //AppDelegate에 대한 참조 변수
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentTab: UISegmentedControl!
    
    @IBAction func segmentTabbed(_ sender: Any) {
        let segmentIndex = segmentTab.selectedSegmentIndex
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    //섹션의 갯수를 설정하는 메소드
    //없으면 1을 리턴
    //그룹화를 하지 않을 거라면 삭제 또는 1을 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
