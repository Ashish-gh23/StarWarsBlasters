//
//  MatchDataCell.swift
//  StarWarsTournament
//
//  Created by Ashish Ranjan on 16/10/23.
//

import UIKit

class MatchDataCell: UITableViewCell {
    
    @IBOutlet weak var bBackgroundView: UIView!
    
    @IBOutlet weak var opponentLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var matchData: MatchModel? {
        didSet {
            updateUserMatchCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUserMatchCell() {
        
    }
    
}
