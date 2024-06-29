//
//  ViewController.swift
//  ApiTask
//
//  Created by Денис Александров on 27.06.2024.
//

import UIKit

enum Link {
    
    case firstSource
    case source
    
    var url: URL {
        switch self {
        case .firstSource:
            return URL(string: "https://jsonplaceholder.typicode.com/posts/2")!
        case .source:
            return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        }
    }
}

enum UserAction: CaseIterable {
    case testFirstSource
    case testSource
    
    var title: String {
        switch self {
        case .testSource:
            return "testSource"
        case .testFirstSource:
            return "firstSource"
        }
    }
}

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "Вывод на консоль"
        case .failed:
            return "Ошибка"
        }
    }
}

final class MainViewController: UICollectionViewController {
    private let userAction = UserAction.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userAction.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        cell.userActionLabel.text = userAction[indexPath.item].title
        
        return cell
    }
    
    // MARK: UIColectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userAction[indexPath.item]
        //        print(userAction)
        
        switch userAction {
        case .testSource: dataOutput()
        case .testFirstSource: fetchSinglePost()
        }
    }
    
    func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async { [unowned self] in
            present(alert, animated: true)
        }
    }
}

