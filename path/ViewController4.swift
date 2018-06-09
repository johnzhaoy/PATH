//
//  ViewController4.swift
//  path
//
//  Created by 赵云 on 2018/6/9.
//  Copyright © 2018年 zbq. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    var rd_type_b=1
    var rd_type_s=1
    var rd_type_r=1
    
    @IBOutlet weak var skate: UISwitch!
    @IBOutlet weak var running: UISwitch!
    @IBOutlet weak var bicycle: UISwitch!
    
    @IBAction func skate_a(_ sender: Any) {
        if(skate.isOn==true)
        {rd_type_s=1}
        else
        {rd_type_s=0}
    }
    @IBAction func running_a(_ sender: Any) {
        if(running.isOn==true)
        {rd_type_r=1}
        else
        {rd_type_r=0}
    }
    @IBAction func bicycle(_ sender: Any) {
        if(bicycle.isOn==true)
        {rd_type_b=1}
        else
        {rd_type_b=0}
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "heart_to_main"
        {
            let detailVC = segue.destination as! ViewController
            detailVC.rd_type_s=rd_type_s
            detailVC.rd_type_r=rd_type_r
            detailVC.rd_type_b=rd_type_b
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
