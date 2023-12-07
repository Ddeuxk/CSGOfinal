//
//  TableViewCell.swift
//  CSGOfinal
//
//  Created by Dunk on 1/12/2566 BE.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbCost: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
