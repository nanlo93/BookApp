//
//  EventCell.swift
//  BookApp
//
//  Created by Shin on 11/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var lblFee: UILabel!
    @IBOutlet weak var lblEntry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
