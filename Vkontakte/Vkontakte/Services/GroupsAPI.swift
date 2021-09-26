//
//  GroupsAPI.swift
//  Vkontakte
//
//  Created by Lera on 22.09.21.
//

import Foundation
import Alamofire

final class GroupsAPI {
    
    // базовый URL сервиса
    let scheme = "https://"
    let baseUrl = "api.vk.com/method"
    
    let token = MySession.shared.token
    let clientId = MySession.shared.userId
    let version = "5.81"
    
    // метод для загрузки данных
    func getGroups(completion: @escaping([GroupModel]?)->()) {
        //название метода API
        let method = "/groups.get"
        // параметры, id клиента, токен, версия
        let parameters: Parameters = [
            "user_id": clientId,
            "extended": 1,
            "count": 100,
            "access_token": token,
            "v": version
        ]
        // составляем URL из базового адреса сервиса и метода API
        let url = scheme + baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
            
        }
    }
}
