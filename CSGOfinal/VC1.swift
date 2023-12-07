//
//  VC1.swift
//  CSGOfinal
//
//  Created by Dunk on 2/12/2566 BE.
//

import UIKit

class VC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TableViewController {
            let tvc = segue.destination as? TableViewController
            
            if segue.identifier == "Pistol" {
                tvc?.gunType = "Pistol"
            } else if segue.identifier == "Rifle" {
                tvc?.gunType = "Rifle"
            } else if segue.identifier == "SMGs" {
                tvc?.gunType = "SMGs"
            } else if segue.identifier == "Heavy" {
                tvc?.gunType = "Heavy"
            } else if segue.identifier == "Others" {
                tvc?.gunType = "Others"
            }
        }
    }

}
