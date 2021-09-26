//
//  FriendsAPI.swift
//  Vkontakte
//
//  Created by Lera on 22.09.21.
//

import Foundation
import Alamofire

final class FriendsAPI {
    
    let scheme = "https://"
    let baseUrl = "api.vk.com/method"
    
    let token = MySession.shared.token
    let clientId = MySession.shared.userId
    let version = "5.81"
    
    func getFriends (completion: @escaping([FriendModel]?)->()) {
        
        let method = "/friends.get"
        let parameters: Parameters = [
            "user_id": clientId,
            "count": 100,
            "fields": "sex, city, country, online",
            "order": "random",
            "access_token": token,
            "v": version
            
        ]
        
        let url = scheme + baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
            
        }
    }
    
}
