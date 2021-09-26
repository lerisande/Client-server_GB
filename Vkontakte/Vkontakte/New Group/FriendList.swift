//
//  FriendList.swift
//  Vkontakte
//
//  Created by Lera on 25.09.21.
//

import Foundation

// MARK: - FriendsResponse
// получаем объект FriendsResponse и наследуемся от Codable

class FriendsResponse: Decodable {
    let response: FriendsModel
}

// MARK: - Response
// внутри FriendsResponse будет объект Friends
class FriendsModel: Decodable {
    let count: Int
    let items: [FriendList]
}

// MARK: - Item
class FriendList: Decodable {
    var firstName = ""
    var lastName = ""
    var photo = ""
    
    // определяем ключи для свойств
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
    
    // конструктор для ручного извлечения
    // передаем decoder, из которого можем извлекать данные (в виде контейнеров)
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        // извлекаем контейнер и получаем из него значени, присваивая их необходимым свойствам
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.photo = try values.decode(String.self, forKey: .photo)
    }
   
}
