//
//  MainTableVC.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController {
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    fileprivate var photos = [Photo]()
    fileprivate let presenter = PhotoPresenter(dataService: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityInd.hidesWhenStopped = true
        self.presenter.attachView(self)
        self.presenter.getPhotos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let vc = segue.destination as? SecondVC,
            let indexPath = self.tableView.indexPathForSelectedRow
            else { return }
        vc.imageName = photos[indexPath.row].url
        
    }
}

extension MainTableVC: PhotoViewProtocol {
    
    func showInd() {
        self.activityInd.startAnimating()
    }
    
    func hideInd() {
        self.activityInd.stopAnimating()
    }
    
    func setInfo(photos: [Photo]) {
        self.photos = photos
        self.tableView.reloadData()
    }
}

extension MainTableVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdCell, for: indexPath) as? MainTableViewCell
            else { return UITableViewCell() }
        guard
            let photoUrl = self.photos[indexPath.row].url,
            let textPhoto = self.photos[indexPath.row].title
            else { return UITableViewCell() }
        
        cell.textPhoto = textPhoto
        cell.photoImageView.downloadedFrom(link: photoUrl)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}
