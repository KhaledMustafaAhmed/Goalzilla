//
//  EventCellVersion|||.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 22/05/2025.
//

import UIKit
import IBAnimatable

class EventCellVersionIII: UICollectionViewCell {

    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    @IBOutlet weak var awayTeamImage: AnimatableImageView!

    @IBOutlet weak var awayTeamTitle: UILabel!
    
    @IBOutlet weak var homeTeamImage: AnimatableImageView!
    
    @IBOutlet weak var homeTeamTitle: UILabel!
    
    
    @IBOutlet weak var containerView: UIView!
    
    
    @IBOutlet weak var homeTeamContainerView: AnimatableView!
    
    
    @IBOutlet weak var awayTeamContainerView: AnimatableView!
    
    static var resuseIdentifier:String = "EventCell3"
    
    static var nib:UINib{
        return UINib.init(nibName: "EventCellVersionIII", bundle: Bundle.init(for: EventCellVersionIII.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
        awayTeamTitle.isSkeletonable = true
        awayTeamImage.isSkeletonable = true
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
    }

}
