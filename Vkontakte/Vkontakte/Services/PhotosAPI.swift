//
//  PhotosAPI.swift
//  Vkontakte
//
//  Created by Lera on 22.09.21.
//

import Foundation
import Alamofire

class PhotosAPI {
    
    // базовый URL сервиса
    let scheme = "https://"
    let baseUrl = "api.vk.com/method"
    
    let token = MySession.shared.token
    let clientId = MySession.shared.userId
    let version = "5.81"
    
    // метод для загрузки данных
    func getPhotos (completion: @escaping([PhotoList]?)->())  {
        //название метода API
        let method = "/photos.getAll"
        // параметры, id клиента, токен, версия
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
        
        // составляем URL из базового адреса сервиса и метода API
        let url = scheme + baseUrl + method
        
        // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            do {
                // распаковываем response.data в data и если все нормально то идем дальше (оператор раннего выхода)
                guard let data = response.data else { return }
                // получили объект вложенный состоящий еще с двух подобъектов
                let photoResponse = try? JSONDecoder().decode(PhotoResponse.self, from: data)
                // вытащили friends
                let photos = photoResponse?.response.items
                
                completion(photos)
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
