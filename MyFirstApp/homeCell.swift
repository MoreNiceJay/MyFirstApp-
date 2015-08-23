//
//  SingleRowCell.swift
//  MyFirstApp
//
//  Created by Lee Janghyup on 8/16/15.
//  Copyright (c) 2015 jay. All rights reserved.
//

import UIKit
import Parse
class homeCell : UITableViewCell {
    
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var labelPreviewTitle: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
