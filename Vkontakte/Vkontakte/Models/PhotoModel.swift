//
//  FriendPhoto.swift
//  Vkontakte
//
//  Created by Lera on 22.07.21.
//

import UIKit

struct PhotoModel {
    
    let image: UIImage
	var isLiked: Bool {
		didSet {
			likeCount += isLiked ? 1 : -1
		}
	}
    var likeCount: Int
}
