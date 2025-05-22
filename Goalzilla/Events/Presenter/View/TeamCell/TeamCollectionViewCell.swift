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
    
    @IBOutlet weak var mainView: UIView!
    static var resuseIdentifier:String = "TeamCell"

    var backgroundImageView: UIImageView!
    static var nib:UINib{
        return UINib.init(nibName: "TeamCollectionViewCell", bundle: Bundle.init(for: TeamCollectionViewCell.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundImage()
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
            teamImage.image = Utils.placeHolder
        }
        backgroundImageView.image = UIImage(named: "eventBg1")
    }
    
    func setupBackgroundImage() {
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
}
