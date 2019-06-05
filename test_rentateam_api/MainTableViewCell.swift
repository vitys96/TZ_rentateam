//
//  MainTableViewCell.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var textPhoto: String? {
        didSet {
            photoLabel.text = textPhoto
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        self.photoImageView.clipsToBounds = true
        self.photoLabel.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        self.photoImageView?.image = UIImage()
    }


}
