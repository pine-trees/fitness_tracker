//
//  excCell.swift
//  fitness_tracker
//
//  Created by Evgeny Shmeerov on 26/09/16.
//  Copyright © 2016 Eugene Shmeerov. All rights reserved.
//

import UIKit

class excCell: UITableViewCell {

    @IBOutlet weak var newNameField: UITextField!
    @IBOutlet weak var icon: UIImageView!
  
    @IBOutlet weak var condField: UITextField!
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
        newNameField.text = excName
        condField.text = "\(cond)"
        discrLbl.text = discr
    }
}
