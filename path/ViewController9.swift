//
//  ViewController9.swift
//  path
//
//  Created by 赵云 on 2018/6/9.
//  Copyright © 2018年 zbq. All rights reserved.
//

import UIKit

class ViewController9: UIViewController {
    var home_page=0
    var recode_page=0
    var trace_page=0
    
    
    
    
    
    @IBAction func start_record(_ sender: Any) {
        recode_page=1
        performSegue(withIdentifier: "start_record", sender:self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "start_record"
        {
            let detailVC = segue.destination as! ViewController
            
            detailVC.home_page=home_page
            detailVC.recode_page=recode_page
            detailVC.trace_page=trace_page
        }
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
