//
//  FriendsAPI.swift
//  Vkontakte
//
//  Created by Lera on 22.09.21.
//

import Foundation
import Alamofire

final class FriendsAPI {
    
    // базовый URL сервиса
    let scheme = "https://"
    let baseUrl = "api.vk.com/method"
    
    let token = MySession.shared.token
    let clientId = MySession.shared.userId
    let version = "5.81"
    
    // метод для загрузки данных
    func getFriends (completion: @escaping ([FriendList]?) -> Void) {
        //название метода API
        let method = "/friends.get"
        // параметры, id клиента, токен, версия
        let parameters: Parameters = [
            "user_id": clientId,
            "count": 100,
            "fields": "sex, city, country, online, photo_100",
            "order": "random",
            "access_token": token,
            "v": version
        ]
        
        // составляем URL из базового адреса сервиса и метода API
        let url = scheme + baseUrl + method
        
        // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            do {
                // распаковываем response.data в data и если все нормально то идем дальше (оператор раннего выхода)
                guard let data = response.data else { return }
                // получили объект вложенный состоящий еще с двух подобъектов
                let friendsResponse = try? JSONDecoder().decode(FriendsResponse.self, from: data)
                // вытащили friends
                let friends = friendsResponse?.response.items
                
                completion(friends)
            }
            catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            }
            catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            }
            catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            }
            catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            }
            catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
            
        }
    }
    
}
