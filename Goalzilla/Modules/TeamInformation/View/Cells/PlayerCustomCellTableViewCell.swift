//
//  PlayerCustomCellTableViewCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 21/5/25.
//

import UIKit
import SkeletonView
import Kingfisher
class PlayerCustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    static var resuseIdentifier: String = "PlayerCustomCellTableViewCell"
        
        static var nib: UINib {
            return UINib(nibName: "PlayerCustomCellTableViewCell", bundle: Bundle.main)
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            isSkeletonable = true
            playerPosition.isSkeletonable = true
            playerImg.isSkeletonable = true
            playerName.isSkeletonable = true
            
            containerView.backgroundColor = UIColor(red: 178/255, green: 235/255, blue: 242/255, alpha: 1.0)
            containerView.layer.cornerRadius = 12
            
            playerImg.layer.cornerRadius = playerImg.frame.size.width / 2
            playerImg.clipsToBounds = true
            
            backgroundColor = .clear
            contentView.backgroundColor = .clear
            selectionStyle = .none
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        func configureCell(player: Player) {
            playerPosition.text = player.playerPosition
            playerName.text = player.playerName
            guard let url = player.playerImage, !url.isEmpty else {
                playerImg.image = Utils.playerPlaceHolder
                return
            }
            playerImg.kf.setImage(with: URL(string: url), placeholder: Utils.playerPlaceHolder)
        }
    
}
