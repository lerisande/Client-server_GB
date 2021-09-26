//
//  PhotoList.swift
//  Vkontakte
//
//  Created by Lera on 25.09.21.
//

import Foundation

// MARK: - FriendsResponse
// получаем объект FriendsResponse и наследуемся от Codable

class PhotoResponse: Decodable {
    let response: PhotosModel
}

// MARK: - Response
// внутри PhotoResponse будет объект Photo
class PhotosModel: Decodable {
    let count: Int
    let items: [PhotoList]
}

// MARK: - Item
class PhotoList: Decodable {
    var album = 0
    var date = 0
    var id = 0
    var sizes: [Any] = []
    var height = 0
    var url = ""
    var type = ""
    var width = 0
    
    // определяем ключи для свойств
    enum CodingKeys: String, CodingKey {
        case album = "album_id"
        case date
        case id
        case sizes
    }
    
    enum SizeKeys: String,  CodingKey {
        case height
        case url
        case type
        case width
    }
    
    
    // конструктор для ручного извлечения
    // передаем decoder, из которого можем извлекать данные (в виде контейнеров)
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        // извлекаем контейнер и получаем из него значени, присваивая их необходимым свойствам
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.album = try values.decode(Int.self, forKey: .album)
        self.date = try values.decode(Int.self, forKey: .date)
        self.id = try values.decode(Int.self, forKey: .id)
        
        // извлекаем нижестоящий контейнер не распаковывая его
        // с помощью метода nestedUnkeyedContainer
        var sizeValues = try values.nestedUnkeyedContainer(forKey: .sizes)
        let firstSizeValues = try sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        self.height = try firstSizeValues.decode(Int.self, forKey: .height)
        self.url = try firstSizeValues.decode(String.self, forKey: .url)
        self.type = try firstSizeValues.decode(String.self, forKey: .type)
        self.width = try firstSizeValues.decode(Int.self, forKey: .width)
    }
   
}


