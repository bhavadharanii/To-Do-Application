//
//  customCell.swift
//  Cardview
//
//  Created by Fiuser on 15/02/23.
//

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var  customView : UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customView.layer.cornerRadius = 20
        customView.layer.borderWidth = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
