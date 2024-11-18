//
//  UICollectionView+Extension.swift
//  Narendra Modi App
//
//  Created by Pradip on 25/12/23.
//

import UIKit

public extension UICollectionView {
    
    // register Class Methods
    
    func registerClass<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.className
        register(cellType, forCellWithReuseIdentifier: className)
    }
    
    func registerClass<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { registerClass(cellType: $0) }
    }
    
    func registerClass<T: UICollectionReusableView>(headerFooterViewType: T.Type,
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader) {
        let className = headerFooterViewType.className
        register(headerFooterViewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func registerClass<T: UICollectionReusableView>(headerFooterViewTypes: [T.Type],
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader) {
        headerFooterViewTypes.forEach { registerClass(headerFooterViewType: $0, ofKind: kind) }
    }
    
    // register Nib Methods
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func register<T: UICollectionReusableView>(headerFooterViewType: T.Type,
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader) {
        let className = headerFooterViewType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func register<T: UICollectionReusableView>(headerFooterViewTypes: [T.Type],
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader) {
        headerFooterViewTypes.forEach { register(headerFooterViewType: $0, ofKind: kind) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                             for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                                 for indexPath: IndexPath,
                                                                 ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
