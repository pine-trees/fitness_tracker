//
//  excCell.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 26/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class excCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var excNameLbl: UILabel!
    @IBOutlet weak var condLbl: UILabel!
    @IBOutlet weak var discrLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfig (excName: String, cond: Int, discr: String) {
        
//        icon.image = image
        excNameLbl.text = excName + "s"
        condLbl.text = "x\(cond)"
        discrLbl.text = discr
    }
}
