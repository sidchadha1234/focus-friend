//
//  MusicCell.swift
//  focusfriend
//
//  Created by Jayanth Peetla on 7/26/20.
//  Copyright © 2020 Peetla. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {

    @IBOutlet weak var back: UIView!
    @IBOutlet weak var label: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "MusicCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        overrideUserInterfaceStyle = .light
        
        back.layer.cornerRadius = 7.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
