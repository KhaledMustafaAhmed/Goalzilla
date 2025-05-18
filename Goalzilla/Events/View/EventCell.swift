//
//  EventCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 17/5/25.
//

import UIKit

class EventCell: UICollectionViewCell {

    @IBOutlet weak var awayTeamTitle: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var eventFinalResultSecondary: UILabel!
    @IBOutlet weak var eventFinalResultPrimary: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var homeTeamTitle: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
