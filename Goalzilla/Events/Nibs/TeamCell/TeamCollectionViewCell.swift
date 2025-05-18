//
//  TeamCollectionViewCell.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 18/05/2025.
//

import UIKit
import SkeletonView

class TeamCollectionViewCell: UICollectionViewCell {
    // MARK: Outlets:
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    static var resuseIdentifier:String = "TeamCell"

    
    static var nib:UINib?{
        return UINib.init(nibName: "TeamCollectionViewCell", bundle: Bundle.init(for: TeamCollectionViewCell.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        teamImage.layer.cornerRadius = 50
        isSkeletonable = true
        contentView.isSkeletonable = true
        teamImage.isSkeletonable = true
        teamName.isSkeletonable = true
    }
}
