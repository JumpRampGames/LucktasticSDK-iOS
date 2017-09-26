//
//  EmailViewController.swift
//  SwiftLucktastic
//
//  Created by Adam Spector on 7/28/17.
//  Copyright © 2017 Gog Avagyan. All rights reserved.
//

import Foundation
import UIKit

class EmailViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var emailPicker: UIPickerView!
    var pickerData: [String] = [String]()
    let USER_INPUT:String = "Enter Email"
    let RANDOM_EMAIL:String = "Random Email"
    let ALWAYS_WIN:String = "always-win@jumprampgames.com"
    
    override func viewDidLoad() {
        print("viewDidLoad")

        super.viewDidLoad()
        self.emailPicker.dataSource = self
        self.emailPicker.delegate = self
        pickerData = [ALWAYS_WIN, RANDOM_EMAIL, USER_INPUT]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        super.viewDidAppear(animated)
        emailText.text = ALWAYS_WIN
        emailText.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        emailPicker.selectRow(0, inComponent: 0, animated: true)
        emailText.text = ALWAYS_WIN
    }
    
    @IBAction func onclick(_ sender: Any) {
        performSegue(withIdentifier: "TableSegue", sender: self)
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickerValue = pickerData[row]
        
        switch pickerValue {
        case USER_INPUT:
            emailText.text = ""
            emailText.isHidden = false
            emailText.isEnabled = true
            emailText.becomeFirstResponder()
            break
        case RANDOM_EMAIL:
            emailText.isHidden = false
            emailText.resignFirstResponder()
            emailText.text = randomEmail()
            emailText.isEnabled = false
            break
        case ALWAYS_WIN:
            emailText.isHidden = false
            emailText.resignFirstResponder()
            emailText.text = ALWAYS_WIN
            emailText.isEnabled = false
            break
        default:
            emailText.isHidden = true
            emailText.resignFirstResponder()
        }
    }
    
    func getPickerValue() -> String {
        return emailText.text!
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    func randomEmail() -> String {
        let randomChars:String = randomString(length: 10)
        return  "lucky.\(randomChars)@domain.com"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableSegue" {
            if let vc = segue.destination as? TestTableViewController {
                vc.initSDK(email: getPickerValue())
            }
        }
    }
    
}
