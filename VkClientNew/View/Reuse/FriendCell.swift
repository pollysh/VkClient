//
//  FriendCell.swift
//  VkClientNew
//
//  Created by Polina Shevchenko on 04/09/2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var FriendName: UILabel!
    @IBOutlet weak var FriendImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(name: Name) {
        FriendImage.image = name.image
        FriendName.text = name.name
        
    }
}
