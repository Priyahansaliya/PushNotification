//
//  HomeDataSourceDelegate.swift
//  PushNotification
//
//  Created by Priya Hansaliya on 05/11/24.
//

import Foundation
import UIKit

//import UIKit

//class HomeDataSourceDelegate: NSObject {
//    
//    typealias T = [String]
//    typealias col = UICollectionView
//    typealias del = ColViewDelegate?
//    typealias vc = UIViewController
//    
//    internal var arrSource: [String]
//    internal var colvw: col
//    internal weak var delegate: del
//    internal weak var vc:vc?
//    
//    let kNumberOfItemsInOneRow: CGFloat = 2
//    let kEdgeInset:CGFloat = 16
//    let minimumInterItemandLinespacing:CGFloat = 12
//    
//    //MARK:- Initializers
//    required init(arrData: [String], delegate: ColViewDelegate, col: UICollectionView,vc:vc) {
//        arrSource = arrData
//        colvw = col
//        self.delegate = delegate
//        self.vc = vc
//        super.init()
//        setupCol()
//    }
//    
//    fileprivate func setupCol(){
//        
//        colvw.register(cellType: HomeCell.self)
//        colvw.dataSource = self
//        colvw.delegate = self
//        colvw.reloadData()
//        colvw.backgroundColor = .white
//        colvw.collectionViewLayout = getCompositionalLayouts()
//
//    }
//    
//    func reload(arr:[String]){
//        arrSource = arr
//        colvw.reloadData()
//    }
//}
//
//extension HomeDataSourceDelegate:UICollectionViewDelegate{
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate?.didSelect?(colView: collectionView, atIndexPath: indexPath)
//    }
//    
//}
//extension HomeDataSourceDelegate:UICollectionViewDataSource {
//    
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 78
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
//        cell.backgroundColor = .random
//        cell.layer.cornerRadius = 8
//        return cell
//    }
//}
//
//extension UIColor {
//    static var random: UIColor {
//        return UIColor(red: .random(in: 0.4...1),
//                       green: .random(in: 0.4...1),
//                       blue: .random(in: 0.4...1),
//                       alpha: 1)
//    }
//}
//
////MARK:- UICollectionViewDelegateFlowLayout Methods
//extension HomeDataSourceDelegate: UICollectionViewDelegateFlowLayout {
//    
//    
//    func getCompositionalLayouts() -> UICollectionViewCompositionalLayout{
//        
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
//        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
//        
//        
//        //--------------Group 1------------//
//
//        let group1Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
//           group1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
//
//
//           let nestedGroup1Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
//           nestedGroup1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
//
//            let nestedGroup2Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
//           nestedGroup2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
//           
//           let nestedGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)), subitems: [nestedGroup2Item1])
//           
//           let nestedGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitems: [nestedGroup1Item1, nestedGroup2])
//
//           let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group1Item1, nestedGroup1])
//
//
//        //--------------Group 2------------//
//        let group2Item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
//        group2Item2.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
//    
//        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group2Item2])
//        
//        //--------------containerGroup------------//
//        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600)) , subitems: [item, group1, group2])
//        let section = NSCollectionLayoutSection(group: containerGroup)
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }
//}

import UIKit

class HomeVC: UIViewController, ColViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var cvList: UICollectionView!
    
    //MARK: - Global Variables
    var dataSourceDelegate: HomeDataSourceDelegate!
    var arrList = [String]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    //MARK: - Method Function
    private func setupCollectionView() {
        if self.dataSourceDelegate == nil {
            self.dataSourceDelegate = .init(arrData: arrList, delegate: self, col: cvList, vc: self)
        } else {
            self.dataSourceDelegate?.reload(arr: arrList)
        }
    }
}

class HomeDataSourceDelegate: NSObject {
    
    typealias T = [String]
    typealias col = UICollectionView
    typealias del = ColViewDelegate?
    typealias vc = UIViewController
    
    internal var arrSource: [String]
    internal var colvw: col
    internal weak var delegate: del
    internal weak var vc: vc?
    
    let kNumberOfItemsInOneRow: CGFloat = 2
    let kEdgeInset: CGFloat = 16
    let minimumInterItemAndLineSpacing: CGFloat = 12
    
    //MARK:- Initializers
    required init(arrData: [String], delegate: ColViewDelegate, col: UICollectionView, vc: vc) {
        arrSource = arrData
        colvw = col
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    fileprivate func setupCol() {
        colvw.register(cellType: HomeCell.self)
        colvw.register(cellType: HomeViewCell.self)
        colvw.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
        colvw.backgroundColor = .white
        colvw.collectionViewLayout = getCompositionalLayouts()
    }
    
    func reload(arr: [String]) {
        arrSource = arr
        colvw.reloadData()
    }
}

extension HomeDataSourceDelegate: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // Define number of sections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2 // Number of items per section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.imgView.image = .eBook1
            cell.backgroundColor = .random
            cell.layer.cornerRadius = 8
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as! HomeViewCell
            cell.lblTitle.text = "text"
            cell.backgroundColor = .random
            cell.layer.cornerRadius = 8
            return cell
        }
    }
    
    // Header view for section titles
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath)
        
        // Customize header view with title
        if let label = headerView.viewWithTag(100) as? UILabel {
            label.text = "Section \(indexPath.section + 1)"
        } else {
            let label = UILabel(frame: headerView.bounds)
            label.tag = 100
            label.text = "Section \(indexPath.section + 1)"
            label.font = .boldSystemFont(ofSize: 18)
            label.textAlignment = .center
            headerView.addSubview(label)
        }
        
        return headerView
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0.4...1),
                       green: .random(in: 0.4...1),
                       blue: .random(in: 0.4...1),
                       alpha: 1)
    }
}

//MARK:- UICollectionViewDelegateFlowLayout Methods
extension HomeDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func getCompositionalLayouts() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        // Groups and layout configuration...
        
        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600)), subitems: [item])
        let section = NSCollectionLayoutSection(group: containerGroup)
        
        // Add header to the section
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
