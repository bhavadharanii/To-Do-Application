//
//  customCell.swift
//  TO-DO-APP()
//
//  Created by Fiuser on 31/01/23.
//

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var taskName : String?
    var date : String?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
