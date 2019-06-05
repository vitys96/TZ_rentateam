//
//  NetworkManager.swift
//  test_rentateam_api
//
//  Created by Виталий Охрименко on 05/06/2019.
//  Copyright © 2019 kaboo. All rights reserved.
//

import UIKit

class NetworkManager {
    
    func fetchData(completion: @escaping (_ photos: [Photo])->()) {
        
        guard let url = URL(string: Constants.urlApi) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Photo].self, from: data)
                completion(courses)
            } catch let error {
                print("Error serialization json", error)
            }
            
            }.resume()
    }
    
}
