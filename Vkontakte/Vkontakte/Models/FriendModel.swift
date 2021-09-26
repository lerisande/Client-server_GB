//
//  FriendModel.swift
//  Vkontakte
//
//  Created by Lera on 11.07.21.
//

import Foundation
import UIKit

struct FriendModel  {

    let name: String
    let avatar: UIImage
    var photoLibrary: [PhotoModel]

    //сравниваем левое значение с правым значением (реализация протокола Comparable?)
	static func == (lhs: FriendModel, rhs: FriendModel) -> Bool {
		lhs.name == rhs.name
	}
}
