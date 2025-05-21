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
    
    static var resuseIdentifier:String = "PlayerCustomCellTableViewCell"

    
    static var nib:UINib{
        return UINib.init(nibName: "PlayerCustomCellTableViewCell", bundle: Bundle.init(for: EventCell.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
        playerPosition.isSkeletonable = true
        playerImg.isSkeletonable = true
        playerImg.isSkeletonable = true
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(player:Player){
        playerPosition.text = player.playerPosition
        playerName.text = player.playerName
        guard let url = player.playerImage else {return}
        playerImg.kf.setImage(with: URL(string: url), placeholder: Utils.placeHolder)
        playerImg.layer.cornerRadius = playerImg.frame.size.width / 2
        playerImg.clipsToBounds = true
        
    }
    
}
