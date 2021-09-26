//
//  MySession.swift
//  Vkontakte
//
//  Created by Lera on 17.09.21.
//

import Foundation

class MySession {
    
    static let shared = MySession()
    private init(){}
    
    var token: String = ""
    var userId: String = ""
}
