//
//  TblViewCollViewDelegate.swift
//  PushNotification
//
//  Created by Priya Hansaliya on 05/11/24.
//

import Foundation
import UIKit

@objc protocol TblViewDelegate : NSObjectProtocol {
    @objc optional func didSectionHeaderSelect(tblView: UITableView, atSection: Int)
    @objc optional func didSelect(tblView: UITableView, atIndexPath: IndexPath)
    @objc optional func willDisplay(tblView: UITableView, willDisplay: UITableViewCell, atIndexPath: IndexPath)
    @objc optional func tbldidScroll(scrollView: UITableView)
    @objc optional func tblViewDidEndDecelerating(scrollView: UITableView)
    //Pratik addded
    @objc optional func tblViewWillBeginDragging(_ scrollView: UITableView)
    @objc optional func tblViewDidEndDragging(_ scrollView: UITableView, willDecelerate decelerate: Bool)
    //======
    @objc optional func didSelectItemName(tblView: UITableView, atIndexPath: IndexPath, text: String)
    
    
    
    // MannKiBaat button action
    
    @objc optional func btnReadMaanKiBaat(index: Int, sender: UIView)
    @objc optional func btnListenMaanKiBaat(index: Int, sender: UIView)
    @objc optional func btnLiveMaanKiBaat(index: Int, sender: UIView)
    
    @objc optional func btnYourIdeaLikeClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaLikeCountClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaReplyClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaShareClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaShareCountClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaDeleteClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaReportClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaOpenProfileClicked(index: Int, sender: UIView)
    @objc optional func btnYourIdeaCellImageClicked(index: Int, sender: UIView)
    @objc optional func btnCommentCountClicked(index: Int, sender: UIView)
    @objc optional func btnMerchandiseClicked(index: Int, sender: UIView)
    @objc optional func btnDonationClicked(index: Int, sender: UIView)
    @objc optional func btnDownloadClicked(index: Int, sender: UIView)
    @objc optional func btnFollowClicked(index: Int, sender: UIView)
    @objc optional func btnOpenProfileClicked(index: Int, sender: UIView)
}




@objc protocol ColViewDelegate: NSObjectProtocol {
    @objc optional func didSelect(colView: UICollectionView, atIndexPath: IndexPath)
    @objc optional func willDisplay(colView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)
    @objc optional func tbldidScroll(scrollView: UICollectionView)
    @objc optional func changeCurrentPage(index: Double)
    @objc optional func tblViewDidEndDecelerating(scrollView: UICollectionView)
    
}
