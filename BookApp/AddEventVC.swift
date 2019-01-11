//
//  AddEventVC.swift
//  BookApp
//
//  Created by Shin on 11/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit

class AddEventVC: UIViewController  {

    @IBOutlet weak var tfBookTitle: UITextField!
    @IBOutlet weak var tfBookAuthor: UITextField!
    @IBOutlet weak var tfPlace: UITextField!
    @IBOutlet weak var tfFee: UITextField!
    @IBOutlet weak var imgBookImage: UIImageView!
    
    @IBAction func btnAddImage(_ sender: Any) {
        //앨범 출력
        var imagePicker = UIImagePickerController()
        //편집 기능 활성화
        imagePicker.allowsEditing = true
        //앨범에 저장된 이미지 가져오기
        imagePicker.sourceType = .photoLibrary
        //delegate 메소드 위치 설정 
        imagePicker.delegate = self
        //화면에 출력
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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

}

extension AddEventVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //취소를 눌렀을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //현재 창 닫기
        self.dismiss(animated: true){
            () in
            let alert = UIAlertController(title: "이미지 선택을 취소하였습니다.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    //사진을 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        self.dismiss(animated: true){
            () in
            //선택한 이미지를 가져와서 imageView에 출력
            let img = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
            self.imgBookImage.image = img
        }
    }

}
