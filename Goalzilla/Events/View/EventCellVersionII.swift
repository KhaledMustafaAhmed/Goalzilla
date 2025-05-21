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
    @IBOutlet weak var versusLabel: UILabel!
    
    private var backgroundImageView: UIImageView!
    
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

        setupBackgroundImage()
        

        configureLabelsForBackground()
    }
    
    private func setupBackgroundImage() {
        backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        backgroundImageView.image = UIImage(named: "eventBg1")
        
        contentView.insertSubview(backgroundImageView, at: 0)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        contentView.insertSubview(overlayView, at: 1)
        
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }
    
    private func configureLabelsForBackground() {
        homeTeamTitle.textColor = .white
        awayTeamTitle.textColor = .white
        eventTime.textColor = .white
        eventDate.textColor = .white
        eventFinalResultPrimary.textColor = .white
        eventFinalResultSecondary.textColor = .white
        eventFinalResultPrimary.font = UIFont.boldSystemFont(ofSize: eventFinalResultPrimary.font.pointSize)
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
        backgroundImageView.image = UIImage(named: "eventBg1")
       
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        homeTeamImage.layer.cornerRadius = homeTeamImage.frame.size.width / 2
        homeTeamImage.clipsToBounds = true
     
        awayTeamImage.layer.cornerRadius = awayTeamImage.frame.size.width / 2
        awayTeamImage.clipsToBounds = true
    
//        homeTeamImage.layer.borderWidth = 1.0
//        homeTeamImage.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
//        
//        awayTeamImage.layer.borderWidth = 1.0
//        awayTeamImage.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
    }
    

}
