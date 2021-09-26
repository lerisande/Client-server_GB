//
//  PhotosAPI.swift
//  Vkontakte
//
//  Created by Lera on 22.09.21.
//

import Foundation
import Alamofire

class PhotosAPI {
    
    let scheme = "https://"
    let baseUrl = "api.vk.com/method"
    
    let token = MySession.shared.token
    let clientId = MySession.shared.userId
    let version = "5.81"
    
    func getPhotos (completion: @escaping([FriendModel]?)->())  {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": clientId,
            "extended": 1,
            "count": 200,
            "photo_sizes": 1,
            "no_service_albums": 0,
            "skip_hidden": 1,
            "access_token": token,
            "v": version
            
        ]
        
        let url = scheme + baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
        }
        
    }
}
