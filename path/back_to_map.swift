//
//  back_to_map.swift
//  path
//
//  Created by 赵云 on 2018/6/8.
//  Copyright © 2018年 zbq. All rights reserved.
//

import UIKit

class back_to_map: UIViewController {
    var home_page=0
    var recode_page=0
    var trace_page=0
    var path:Path?
    
    
    @IBOutlet weak var who: UILabel!
    @IBOutlet weak var RDkind: UILabel!
    @IBOutlet weak var descp: UILabel!
    @IBOutlet weak var RDname: UILabel!
    
    
    
    @IBAction func back(_ sender: Any) {
        trace_page=1
        performSegue(withIdentifier: "backbackback", sender:self)
        //print(trace_page)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backbackback"
        {
            let detailVC = segue.destination as! ViewController
            
            detailVC.home_page=home_page
            detailVC.recode_page=recode_page
            detailVC.trace_page=trace_page
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        who.text=path?.createrName
        descp.text=path?.discription1
        RDname.text=path?.pathName
        switch path?.pathType {
        case "C":
            RDkind.text="Cycling Road"
            break
        case "S":
            RDkind.text="Skateboard Road"
            break
        case "R":
            RDkind.text="Running Road"
            break
        default:
            break
        }
        who.textAlignment=NSTextAlignment.center
        descp.textAlignment=NSTextAlignment.center
        RDkind.textAlignment=NSTextAlignment.center
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
