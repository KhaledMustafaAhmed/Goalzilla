//
//  SportLeagueTableViewCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import UIKit

class SportLeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!

    static var resuseIdentifier:String = "customLeagueCell"
    
    static var nib:UINib?{
        return UINib.init(nibName: "SportLeagueTableViewCell", bundle: Bundle.init(for: SportLeagueTableViewCell.self))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
