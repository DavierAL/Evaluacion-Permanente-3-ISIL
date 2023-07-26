//
//  HomeTableViewCell.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imageHeroe: UIImageView!
    @IBOutlet weak var nameHeroe: UILabel!
    @IBOutlet weak var fullName: UILabel!

    @IBOutlet weak var stackBack: UIStackView!
    
    var homeViewModelCell: HomeCellViewModel? {
        didSet {
            imageHeroe.loadImage(from: homeViewModelCell?.posterUrl ?? "")
            nameHeroe.text = homeViewModelCell?.nameHeroe
            stackBack.layer.cornerRadius = 5
        }
    }
    
}
