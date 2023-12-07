//
//  VCWebkit.swift
//  CSGOfinal
//
//  Created by Dunk on 2/12/2566 BE.
//

import UIKit
import WebKit

class VCWebkit: UIViewController {
    
    var urlplace:String="https://cslabez.com/complete-cs2-smoke-guide/"

    @IBOutlet weak var webShow: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:urlplace)
        let myRequest = URLRequest(url: myURL!)
        webShow.load(myRequest)
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
