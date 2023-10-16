//
//  UserPointsTableViewCell.swift
//  StarWarsTournament
//
//  Created by Ashish Ranjan on 16/10/23.
//

import UIKit

class UserPointsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var pointData: PlayerPoints? {
        didSet {
            updatePlayerCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func updatePlayerCell() {
        self.idLabel.text = "\(pointData?.id)"
        self.pointsLabel.text = "\(pointData?.points)"
    }
    
}
