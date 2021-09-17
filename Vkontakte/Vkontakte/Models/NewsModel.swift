//
//  NewsModel.swift
//  Vkontakte
//
//  Created by Lera on 23.07.21.
//

import Foundation
import UIKit

struct NewsModel {
    
    let avatar: UIImage
    let name: String
    let date: String
    let text: String
    let image: UIImage
    var likes: UInt = UInt.random(in: 0..<255)
    var comments: UInt = UInt.random(in: 0..<255)
    var replies: UInt = UInt.random(in: 0..<255)
    var views: UInt = UInt.random(in: 0..<255)
//
//    var isLiked: Bool {
//        didSet {
//            likeCount += isLiked ? 1 : -1
//        }
//    }
//    var likeCount: Int
    
}
