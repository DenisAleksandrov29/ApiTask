//
//  MainViewController+Networking.swift
//  ApiTask
//
//  Created by Денис Александров on 29.06.2024.
//

import UIKit

extension MainViewController {
    
     func dataOutput() {
        URLSession.shared.dataTask(with: Link.source.url) { [weak self] data, _, error in
            guard let data else {
                DispatchQueue.main.async {
                    print(error?.localizedDescription ?? "No error description")
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let posts = try decoder.decode([Information].self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(withStatus: .success)
                    print(posts)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(withStatus: .failed)
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
    
     func fetchSinglePost() {
        URLSession.shared.dataTask(with: Link.firstSource.url) { [weak self] data, _, error in
            guard let data else {
                DispatchQueue.main.async {
                    print(error?.localizedDescription ?? "No error description")
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let post = try decoder.decode(Information.self, from: data)
                DispatchQueue.main.async {
                    self?.showAlert(withStatus: .success)
                    print(post)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self?.showAlert(withStatus: .failed)
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
}


