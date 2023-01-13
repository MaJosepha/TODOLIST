//
//  TodoTableViewCell.swift
//  TODOLIST
//
//  Created by Josepha Massudom on 03/01/2023.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var nom: UILabel!
    
    
    
}
