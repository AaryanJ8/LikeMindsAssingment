//
//  CustomTableViewCell.swift
//  Assignment
//
//  Created by satyam singh on 02/06/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackCount: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
