//
//  SecondVC.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.downloadImage()
    }
    
    private func downloadImage() {
        
        guard let link = imageName else { return }
        self.imageView.downloadedFrom(link: link)
    }

}
