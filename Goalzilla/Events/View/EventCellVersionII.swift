//
//  EventCellVersionII.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

import UIKit

class EventCellVersionII: UICollectionViewCell {

    @IBOutlet weak var awayTeamTitle: UILabel!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var eventFinalResultSecondary: UILabel!
    @IBOutlet weak var eventFinalResultPrimary: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var homeTeamTitle: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    
    static var resuseIdentifier:String = "EventCell2"

    
    static var nib:UINib{
        return UINib.init(nibName: "EventCellVersionII", bundle: Bundle.init(for: EventCellVersionII.self))
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
        homeTeamImage.kf.setImage(with: URL(string: event.eventHomeTeamLogo ?? ""), placeholder: Utils.placeHolder)
        awayTeamImage.kf.setImage(with: URL(string: event.eventAwayTeamLogo ?? ""), placeholder: Utils.placeHolder)
        eventFinalResultPrimary.text = event.eventFinalResult ?? ""
        eventFinalResultSecondary.text = event.eventAwayFinalResultForCricket ?? ""
    }
    override func layoutSubviews() {
//        homeTeamImage.layer.cornerRadius = homeTeamImage.frame.size.width / 2
//        homeTeamImage.clipsToBounds = true
//        homeTeamImage.layer.borderWidth = 2
//        homeTeamImage.layer.borderColor = UIColor.white.cgColor
        
//        awayTeamImage.layer.cornerRadius = awayTeamImage.frame.size.width / 2
//        awayTeamImage.clipsToBounds = true
//        awayTeamImage.layer.borderWidth = 2
//        awayTeamImage.layer.borderColor = UIColor.white.cgColor

    }
}
