//
//  UICollectionViewCell.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/20/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import UIKit

class uiCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var labelColorCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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


