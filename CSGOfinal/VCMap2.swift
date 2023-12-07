//
//  VCMap2.swift
//  CSGOfinal
//
//  Created by Dunk on 2/12/2566 BE.
//

import UIKit

class VCMap2: UIViewController {
    
    var mapImgs:String=""
    var mapNames:String=""
    var mapIcons:String=""
    var mapDetails:String=""
    

    @IBOutlet weak var imgMap: UIImageView!
    @IBOutlet weak var textDetail: UITextView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgMap.image=UIImage.init(named: mapImgs)
        lbName.text=mapNames
        imgIcon.image=UIImage.init(named: mapIcons)
        textDetail.text=mapDetails
        
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
