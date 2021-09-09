//
//  FriendsCollectionViewCell.swift
//  VkClientNew
//
//  Created by Polina Shevchenko on 08/09/2021.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var FriendName: UILabel!
    @IBOutlet weak var FriendImage: UIImageView!
    
    func configure(name: Name) {
        FriendImage.image = name.image
        FriendName.text = name.name
    }
}
