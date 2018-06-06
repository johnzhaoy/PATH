//
//  view 3.swift
//  path
//
//  Created by 赵云 on 2018/5/29.
//  Copyright © 2018年 zbq. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
class ViewController3: UIViewController {
}


class ViewController5: UIViewController
{
    var home_page=0
    var recode_page=0
    var trace_page=0
    
    @IBAction func navi(_ sender: Any) {
    
    
        home_page=0
        recode_page=0
        trace_page=1
        print(trace_page)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "enter_navi" {
            let detailVC = segue.destination as! ViewController
            
            detailVC.home_page=home_page
            detailVC.recode_page=recode_page
            detailVC.trace_page=trace_page
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
