//
//  EventCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 17/5/25.
//

import UIKit
import SkeletonView
import Kingfisher

class EventCell: UICollectionViewCell {

    @IBOutlet weak var awayTeamTitle: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var eventFinalResultSecondary: UILabel!
    @IBOutlet weak var eventFinalResultPrimary: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var homeTeamTitle: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    
    static var resuseIdentifier:String = "EventCell"

    
    static var nib:UINib{
        return UINib.init(nibName: "EventCell", bundle: Bundle.init(for: EventCell.self))
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
        awayTeamTitle.isSkeletonable = true
        awayTeamImage.isSkeletonable = true
        eventFinalResultSecondary.isSkeletonable = true
        eventFinalResultPrimary.isSkeletonable = true
        eventDate.isSkeletonable = true
        eventTime.isSkeletonable = true
        awayTeamTitle.isSkeletonable = true
        homeTeamImage.isSkeletonable = true
        homeTeamTitle.isSkeletonable = true
    }
    
    func setData(event:EventDataMapper){
        homeTeamTitle.text = event.eventHomeTeam ?? "nodata"
        awayTeamTitle.text = event.eventAwayTeam ?? "nodata"
        eventTime.text = event.eventTime ?? "nodata"
        eventDate.text = event.eventDate ?? "nodata"
//        homeTeamImage.kf.setImage(with: URL(string: event.eventHomeTeamLogo ?? ""), placeholder: Utils.placeHolder)
//        awayTeamImage.kf.setImage(with: URL(string: event.eventAwayTeamLogo ?? ""), placeholder: Utils.placeHolder)
//        eventFinalResultPrimary.text = event.eventFinalResult
//        eventFinalResultSecondary.text = event.eventAwayFinalResultForCricket
    }

}
