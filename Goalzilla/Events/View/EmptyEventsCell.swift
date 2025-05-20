//
//  EmptyEventsCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 20/5/25.
//

import UIKit

class EmptyEventsCell: UICollectionViewCell {

    @IBOutlet weak var emptyEventsImage: UIImageView!
    static var resuseIdentifier:String = "emptyEvents"

    static var nib:UINib?{
        return UINib.init(nibName: "EmptyEventsCell", bundle: Bundle.init(for: SportLeagueTableViewCell.self))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(eventType: String){
        emptyEventsImage.image = Utils.emptyEventsPlaceHolder(for: eventType)
        
    }
}
