//
//  ViewController0.swift
//  path
//
//  Created by 赵云 on 2018/6/10.
//  Copyright © 2018年 zbq. All rights reserved.
//

import UIKit
import LeanCloud


class ViewController0: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
       var a = username.text
       var b = password.text
        if a != nil && b != nil {
            let str = a! + " " + b!
           let ssa =  UIAlertController(title: "asdf", message: str, preferredStyle: .alert )
        }
        LCUser.logIn(username: a!, password: b!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
