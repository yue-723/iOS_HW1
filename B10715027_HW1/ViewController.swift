//
//  ViewController.swift
//  B10715027_HW1
//
//  Created by mac10 on 2021/3/4.
//  Copyright © 2021 mac10. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var helloUser: UILabel!
    @IBOutlet weak var ScoreTable: UILabel!

    @IBOutlet weak var slot: UIPickerView!
    let symbol = ["😎" , "😡" , "🐒" , "🔥" ,"🇹🇼" ,"🈹"]
    var score = 0
    var col = [String]()
    var col2 = [String]()
    var col3 = [String]()
    
    var temp: String = ""
    var temp2: String = ""
    var temp3: String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return 100.0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return col[row]
        }else if component == 1{
            return col2[row]
        }else{
            return col3[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = col[row]
        } else if component == 1 {
            pickerLabel.text = col2[row]
        } else {
            pickerLabel.text = col3[row]
        }
        
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center

        return pickerLabel
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0{
            temp = col[row]
        }else if component == 1{
            temp2 = col2[row]
        }else{
            temp3 = col3[row]
            if temp == temp2{
                if temp2 == temp3{
                    score += 1
                    ScoreTable.text = String(score)
                }
            }
        }
    }
    @IBAction func BtnClick(_ sender: UIButton) {
        let index = Int(arc4random()) % 94 + 3
        let index2 = Int(arc4random()) % 94 + 3
        let index3 = Int(arc4random()) % 94 + 3
        	
        slot.selectRow(index, inComponent: 0, animated: true)
        slot.selectRow(index2, inComponent: 1, animated: true)
        slot.selectRow(index3, inComponent: 2, animated: true)
        
        slot.delegate?.pickerView?(slot, didSelectRow: index, inComponent: 0)
        slot.delegate?.pickerView?(slot, didSelectRow: index2, inComponent: 1)
        slot.delegate?.pickerView?(slot, didSelectRow: index3, inComponent: 2)
    }
    override func  viewDidAppear(_ animated: Bool) {

        func login() {
            let alert = UIAlertController(title: "登入", message: "請輸入帳號密碼", preferredStyle: .alert)
            alert.addTextField{(logintext) in
                logintext.placeholder = "ID"
            }
            alert.addTextField{(pwtext) in
                pwtext.placeholder = "Password"
                pwtext.isSecureTextEntry = true
            }
            let LoginAction = UIAlertAction(title: "登入", style: .default){
                (action) in
                
                if alert.textFields![0].text! == ""{
                    let alert2 = UIAlertController(title: "請輸入帳號", message: "", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default){
                        (action) in
                        self.present(alert,animated: true , completion: nil)
                    }
                    alert2.addAction(okAction)
                    self.present(alert2, animated: true , completion: nil)
                    
                }else{
                    self.helloUser.text = "您好, " + alert.textFields![0].text!
                }
                
            }
            
            let cancelAction = UIAlertAction(title: "取消", style: .cancel){
                (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(LoginAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true , completion: nil)
        }
        login()
        
    }
    
    override func viewDidLoad() {
        
        helloUser.text = "您好"
        ScoreTable.text = "0"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 1...100{
            col.append(symbol[(Int)(arc4random() % 6)])
            col2.append(symbol[(Int)(arc4random() % 6)])
            col3.append(symbol[(Int)(arc4random() % 6)])
        }
        slot.selectRow(2, inComponent: 0, animated: true)
        slot.selectRow(2, inComponent: 1, animated: true)
        slot.selectRow(2, inComponent: 2, animated: true)
    }


}

