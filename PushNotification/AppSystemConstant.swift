//
//  AppSystemConstant.swift
//  PushNotification
//
//  Created by Priya Hansaliya on 05/11/24.
//

import Foundation
import UIKit
//MARK: - Application System Constant Value


struct AppSystemConstant {
    
    private init() { }
    
    static var applicationName: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    static var applicationShortVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }
    
    static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier ?? "com.namo.narendramodiapp"
    }
    
    static var is_iPad: Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    
    static var is_iPhone: Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    
    static var screenWidth: CGFloat { return UIScreen.main.bounds.size.width }
    
    static var screenHeight: CGFloat { return UIScreen.main.bounds.size.height }
    
    static var screenMaxLength: CGFloat { return max(screenWidth, screenHeight) }
    
    static var screenMinLength: CGFloat { return min(screenWidth, screenHeight) }
    
    static var iPad_margin: CGFloat { return 70 }
    
    static var bottomMarginFromSafeArea: CGFloat {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0
    }

    static var topMarginFromSafeArea: CGFloat {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0
    }
    
    static var leftMarginFromSafeArea: CGFloat {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.left ?? 0
    }
    
    static var rightMarginFromSafeArea: CGFloat {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.right ?? 0
    }
    
    static var statusBarHeight : CGFloat {
        return UIApplication.shared.delegate?.window??.windowScene?.statusBarManager?.statusBarFrame.height ?? 20
    }
    
    static var isDarkModeAppearance: Bool {
        if #available(iOS 13.0, *) {
            return UITraitCollection.current.userInterfaceStyle == .dark
        } else {
            return false
        }
    }
    
}


let osVersion = UIDevice.current.systemVersion
//let isRightToLeft = Global.isCurrentLanguageRTL()

//MARK:- AppDelegates instances
//var appDelegate : AppDelegate? { return UIApplication.shared.delegate as? AppDelegate }

let ALPHABETS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let NUMERIC = "1234567890"
let ALLOWED_SPECIAL_CHARACTER = "&@._-'/"
let ALPHABETS_NUMERIC_SPACE = "\(ALPHABETS)\(NUMERIC) "
let ALPHABETS_SPACE = "\(ALPHABETS) "
let K_YouTubeImageType = "mqdefault.jpg"
let kk_file_image_url = "file_image_url"
let key_videourl = "videourl"
let placeHolderVideo = UIImage(named: "attachMediaVideo")
let placeHolderImage =  UIImage(named: "listPlaceholder")

let kYouTubeIDPrefix = "https://www.youtube.com/watch?v="
let kk_file_image_width = "file_image_width"
let kk_file_image_height = "file_image_height"
let shareTextVia = "via NaMo App"
let viaMyNt = "via MyNt"
let OnNMApp = "on NaMo App"
let kAction_volunteer_invite = "invitefriends"
let  kTitleCharLimit = 500
let kAction_volunteer_transformingIndia = "transformingindia"
let kAction_network = "network"
let kAction_volunteer_share = "shareall"
let kFloatingBtnSize:CGFloat = AppSystemConstant.is_iPad ? 75.0 : 50.0
let kFloatingButtonBottomPadding  = AppSystemConstant.is_iPad ? 20.0 : 20.0
let kFloatingButtonTrailingPadding  = AppSystemConstant.is_iPad ? 25.0 : 20.0
let key_dynamic_link_referral_url = "dynamic_link_referral_url"
let kFIRDynamicLinkDomain = "n-m4.in"
//var ONLY_PDF_Types: [String] {
//    if #available(iOS 14.0, *) {
//        return [UTType.pdf.identifier]
//    } else {
//        return [kUTTypePDF as String]
//    }
//}

var AllDoc_Types: [String] { return ["public.content"] }

//var arrdocTypesForProfile : [String] {
//    return ["public.image", ONLY_PDF_Types.first!]
//}
//


func common_htmlStringWithDiv(font_size:Int = 36, htmlString: String) -> String {
    """
    <!doctype html>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <html>
        <head>
            <style>
                body {
                    font-size: \(font_size)px;
                    display:flex;
                }
            </style>
        </head>
        <body>
            <div>
                \(htmlString)
            </div>
        </body>
    </html>
    """
}




                                              
