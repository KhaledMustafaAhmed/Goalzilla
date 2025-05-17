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
    
    static var nib:UINib?{
        return UINib.init(nibName: "SportLeagueTableViewCell", bundle: Bundle.init(for: SportLeagueTableViewCell.self))
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSkeletonable = true
        contentView.isSkeletonable = true
        leagueImage.isSkeletonable = true
        leagueLabel.isSkeletonable = true
        
    }

}
    

