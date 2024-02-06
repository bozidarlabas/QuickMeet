////
////  AppointmentListFlowLayout.swift
////  QuickMeet
////
////  Created by Bozidar Labas on 06.02.2024..
////
//
//import UIKit
//
//class CustomFlowLayout: UICollectionViewFlowLayout {
//    override init() {
//        super.init()
//        setupLayout()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupLayout()
//    }
//    
//    func setupLayout() {
//        scrollDirection = .vertical
//        sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }
//    
//    override func targetSize(forItemAt index: Int) -> CGSize {
//        guard let collectionView = collectionView else {
//            return CGSize(width: 0, height: 0)  // Or any default size
//        }
//        
//        // Set the size of each cell dynamically
//        return CGSize(width: collectionView.bounds.width - sectionInset.left - sectionInset.right, height: 100)
//    }
//}
