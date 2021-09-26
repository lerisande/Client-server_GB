//
//  SearchGroupsAPI.swift
//  Vkontakte
//
//  Created by Lera on 22.09.21.
//

import Foundation
import Alamofire

class SearchGroupsAPI {
    
    // базовый URL сервиса
    let scheme = "https://"
    let baseUrl = "api.vk.com/method"
    
    let token = MySession.shared.token
    let clientId = MySession.shared.userId
    let version = "5.81"
    
    // метод для загрузки данных
    func searchGroups (competion: @escaping([GroupModel]?)->()) {
        //название метода API
        let method = "/groups.search"
        // параметры, id клиента, токен, версия
        let parameters: Parameters = [
            "count": 10,
            "type": "group",
            "sort": 6,
            "access_token": token,
            "v": version,
            "q": "AnimalPlanet"
        ]
        
        // составляем URL из базового адреса сервиса и метода API
        let url = scheme + baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
        }
    }
}
