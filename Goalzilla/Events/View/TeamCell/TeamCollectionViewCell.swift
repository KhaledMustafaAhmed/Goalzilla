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

    
    static var nib:UINib{
        return UINib.init(nibName: "TeamCollectionViewCell", bundle: Bundle.init(for: TeamCollectionViewCell.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("teamImage = \(teamImage)") // should not be nil
            print("teamName = \(teamName)")

        isSkeletonable = true
        contentView.isSkeletonable = true
        teamImage.isSkeletonable = true
        teamName.isSkeletonable = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        teamImage.layer.cornerRadius = teamImage.frame.size.width / 2
        teamImage.clipsToBounds = true
    }
    
    func setData(team:TeamDataMapper){
        teamName.text = team.name
        if let stringURL = team.logo {
            teamImage.kf.setImage(with: URL(string: stringURL) , placeholder: Utils.placeHolder)
        }else{
            teamImage.image = UIImage(named: "pic-1")
        }
    }
}
