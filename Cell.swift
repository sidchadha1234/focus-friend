//
//  Cell.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/27/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var label: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "Cell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 7.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
