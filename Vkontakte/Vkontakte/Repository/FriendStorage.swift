//
//  FriendStorage.swift
//  Vkontakte
//
//  Created by Lera on 11.07.21.
//

import Foundation
import UIKit

class FriendStorage {
    let friends: [FriendModel]
    
    init() {
        friends = [
            FriendModel(name: "Anna Dvorak", avatar: (UIImage(named: "woman1")!),
                        photoLibrary: friend1),
            FriendModel(name: "Nicolas Teder", avatar: (UIImage(named: "man1")!),
                        photoLibrary: friend2),
            FriendModel(name: "Lisa Coen", avatar: (UIImage(named: "woman2")!),
                        photoLibrary: friend3),
            FriendModel(name: "Rick Nowak", avatar: (UIImage(named: "man2")!),
                        photoLibrary: friend4),
            FriendModel(name: "Anton Kowalski", avatar: (UIImage(named: "man3")!),
                        photoLibrary: friend5),
            FriendModel(name: "Jeni Amparo",
                        avatar: (UIImage(named: "woman3")!),
                        photoLibrary: friend6),
            FriendModel(name: "Stephen Walczak",
                        avatar: (UIImage(named: "man4")!),
                        photoLibrary: friend7),
            FriendModel(name: "Ted Lewandowski", avatar: (UIImage(named: "man5")!),
                        photoLibrary: friend8),
        ]
    }
    var friend1:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"woman1.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman1.2")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman1.3")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman1.4")!, isLiked: false, likeCount: 0),]
    
    var friend2:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"man1.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man1.2")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man1.3")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man1.4")!, isLiked: false, likeCount: 0),]
    
    var friend3:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"woman2.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman2.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman2.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman2.1")!, isLiked: false, likeCount: 0),]
    
    var friend4:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"man2.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man2.2")!, isLiked: false, likeCount: 0),]
    
    var friend5:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"man3.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man3.2")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man3.3")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man3.4")!, isLiked: false, likeCount: 0),]
    
    var friend6:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"woman3.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman3.2")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman3.3")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman3.4")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman3.5")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman3.6")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"woman3.7")!, isLiked: false, likeCount: 0),]
    
    var friend7:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"man4.1")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man4.2")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man4.3")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man4.4")!, isLiked: false, likeCount: 0),]
    
    var friend8:[PhotoModel] =
		[PhotoModel(image: UIImage(named:"man5")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man5")!, isLiked: false, likeCount: 0),
		 PhotoModel(image: UIImage(named:"man5")!, isLiked: false, likeCount: 0),]
}
