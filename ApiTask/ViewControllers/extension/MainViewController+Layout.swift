//
//  MainViewController+Layout.swift
//  ApiTask
//
//  Created by Денис Александров on 29.06.2024.
//

import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 30)
    }
}
