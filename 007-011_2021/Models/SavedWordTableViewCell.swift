//
//  SavedWordTableViewCell.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 18.12.2021.
//

import UIKit

class SavedWordTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var speachPartLabel: UILabel!
    
    //MARK: lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(word: Word) -> Void {
        wordLabel.text = word.word
        speachPartLabel.text = word.speachPart
    }
}

