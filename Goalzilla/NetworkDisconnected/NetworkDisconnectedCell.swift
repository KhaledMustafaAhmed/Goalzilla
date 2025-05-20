//
//  NetworkDisconnectedCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

import UIKit

class NetworkDisconnectedCell: UICollectionViewCell {

    @IBOutlet weak var networkDisconnectImage: UIImageView!
    static var resuseIdentifier:String = "networkDisconnectedCell"

    static var nib:UINib?{
        return UINib.init(nibName: "NetworkDisconnectedCell", bundle: Bundle.init(for: SportLeagueTableViewCell.self))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
