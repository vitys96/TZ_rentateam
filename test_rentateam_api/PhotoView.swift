//
//  PhotoView.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import Foundation

protocol PhotoViewProtocol: NSObjectProtocol {
    func showInd()
    func hideInd()
    func setInfo(photos: [Photo])
}
