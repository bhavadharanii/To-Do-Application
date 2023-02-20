//
//  upcomingTableViewCell.swift
//  Cardview
//
//  Created by Fiuser on 20/02/23.
//

import UIKit

class upcomingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var upcomingDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
