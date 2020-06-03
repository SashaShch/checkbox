//
//  ViewController.swift
//  Checkbox
//
//  Created by Рома on 02.06.2020.
//  Copyright © 2020 SashaShch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [.red, .green, .blue, .orange, .purple, .systemPink, .systemGray, .systemYellow, .red, .green, .blue, .orange, .purple, .systemPink, .systemGray, .systemYellow, .red, .green]
    let cellCountPerRow = 3
    let cellMargin: CGFloat = 7

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "box", for: indexPath) as! CheckboxViewCell
        cell.backgroundColor = colors[indexPath.item]
        
        if cell.check {
            cell.checkImage.isHidden = false
        } else {
            cell.checkImage.isHidden = true
        }
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CheckboxViewCell
        cell.check = !cell.check
    }
}



extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: cellMargin, left: cellMargin, bottom: cellMargin, right: cellMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor((UIScreen.main.bounds.width - CGFloat(cellCountPerRow + 1) * cellMargin) / CGFloat(cellCountPerRow))
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
}

