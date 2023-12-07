//
//  VC2.swift
//  CSGOfinal
//
//  Created by Dunk on 1/12/2566 BE.
//

import UIKit

class VC2: UIViewController {
    var gImg:String=""
    var gName:String=""
    var gCost:String=""
    var gSpray:String=""
    var gDetail:String=""
    
    
    @IBOutlet weak var imgSpray: UIImageView!
    @IBOutlet weak var textDetail: UITextView!
    @IBOutlet weak var lbCost: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgGun: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgGun.image=UIImage.init(named: gImg)
        lbName.text=gName
        lbCost.text=gCost
        textDetail.text=gDetail
        imgSpray.image=UIImage.init(named: gSpray)
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
