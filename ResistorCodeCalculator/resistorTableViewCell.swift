//
//  resistorTableViewCell.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/22/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import UIKit

class resistorTableViewCell: UITableViewCell {

    
    @IBOutlet weak var valueResistorLabel: UILabel!
    @IBOutlet weak var color1Res: UIView!
    @IBOutlet weak var color2Res: UIView!
    @IBOutlet weak var color6Res: UIView!
    @IBOutlet weak var color5Res: UIView!
    @IBOutlet weak var color4Res: UIView!
    @IBOutlet weak var color3Res: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 0.85, y: 0.85) : CGAffineTransform.identity
            }) { _ in
            }
            UIView.animate(withDuration: 0.5, delay: 0.25, animations: {
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.0, y: 1.0) : CGAffineTransform.identity
            }) { _ in
            }
        }
    }
}
