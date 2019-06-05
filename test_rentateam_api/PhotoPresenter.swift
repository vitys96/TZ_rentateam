//
//  Presenter.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class PhotoPresenter {
    
    weak private var photosView: PhotoViewProtocol?
    private let dataService: NetworkManager!
    
    private let url = "https://anapioficeandfire.com/api/books/"
    
    init(dataService: NetworkManager) {
        self.dataService = dataService
    }
    
    func attachView(_ viewProtocol: PhotoViewProtocol) {
        self.photosView = viewProtocol
    }
    
    func getPhotos() {
        DispatchQueue.main.async {
            self.photosView?.showInd()
        }
        
        dataService.fetchData() { [weak self] photos in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.photosView?.setInfo(photos: photos)
                self.photosView?.hideInd()
            }
            
        }
    }
}
