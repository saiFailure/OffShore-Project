//
//  TableViewCell.swift
//  OffShoresTask
//
//  Created by Sainath MAC on 02/04/1942 Saka.
//  Copyright © 1942 Sainath MAC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var titleNameOutlet: UILabel!
    @IBOutlet weak var checkUncheckButtonAction: UIButton!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
