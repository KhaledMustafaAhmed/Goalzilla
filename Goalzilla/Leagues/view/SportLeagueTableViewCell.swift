//
//  SportLeagueTableViewCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import UIKit
import SkeletonView
import ShimmerView

class SportLeagueTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    static var resuseIdentifier:String = "customLeagueCell"
    
    private let shimmerLabel = ShimmerView()
    private let shimmerImage = ShimmerView()
    
    static var nib:UINib?{
        return UINib.init(nibName: "SportLeagueTableViewCell", bundle: Bundle.init(for: SportLeagueTableViewCell.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
        contentView.isSkeletonable = true
        leagueImage.isSkeletonable = true
        leagueLabel.isSkeletonable = true
        
        //
        //        shimmerImage.frame = leagueImage.frame
        //        shimmerImage.layer.cornerRadius = leagueImage.frame.height / 2
        //        shimmerImage.layer.masksToBounds = true
        //        contentView.addSubview(shimmerImage)
        //
        //
        //        shimmerLabel.frame = leagueLabel.frame
        //        shimmerLabel.layer.cornerRadius = 4
        //        shimmerLabel.layer.masksToBounds = true
        //        contentView.addSubview(shimmerLabel)
        //
        //        shimmerImage.isHidden = true
        //        shimmerLabel.isHidden = true
        
        //    }
        
        
        
        //
        //      func startShimmer() {
        //          shimmerImage.isHidden = false
        //          shimmerLabel.isHidden = false
        //
        //          shimmerImage.startAnimating()
        //          shimmerLabel.startAnimating()
        //
        //          leagueLabel.text = nil
        //          leagueImage.image = nil
        //      }
        //
        //      func stopShimmer() {
        //          shimmerImage.stopAnimating()
        //          shimmerLabel.stopAnimating()
        //          shimmerImage.isHidden = true
        //          shimmerLabel.isHidden = true
        //      }
        
    }
    
}
