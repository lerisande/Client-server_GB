//
//  GroupList.swift
//  Vkontakte
//
//  Created by Lera on 25.09.21.
//

import Foundation

// MARK: - GroupsResponse
class GroupsResponse: Decodable {
    let response: GroupsModel
}

// MARK: - Response
class GroupsModel: Decodable {
    let count: Int
    let items: [GroupList]
}

class GroupList: Decodable {
    var name = ""
    var image = ""
    
    // определяем ключи для свойств
    enum CodingKeys: String, CodingKey {
        case name
        case image = "photo_100"
    }
    
    // конструктор для ручного извлечения
    // передаем decoder, из которого можем извлекать данные (в виде контейнеров)
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        // извлекаем контейнер и получаем из него значени, присваивая их необходимым свойствам
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.image = try values.decode(String.self, forKey: .image)
    }
   
}
