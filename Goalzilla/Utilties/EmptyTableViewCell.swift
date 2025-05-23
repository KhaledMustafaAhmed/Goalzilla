//
//  EmptyTableViewCell.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 21/5/25.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var targetImg: UIImageView!
    static var resuseIdentifier:String = "emptyDataCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var nib:UINib?{
        return UINib.init(nibName: "EmptyTableViewCell", bundle: Bundle.init(for: EmptyTableViewCell.self))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(img:UIImage){
        self.targetImg.image = img
    }
}
