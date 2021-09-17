//
//  GroupStorage.swift
//  Vkontakte
//
//  Created by Lera on 11.07.21.
//

import Foundation
import UIKit

class GroupStorage {
    let groups: [GroupModel]
    let allGroups: [GroupModel]
    
    init() {
        groups = [
            GroupModel(name: "National Geografic", avatar: UIImage(named: "nationalGeographic")!),
            GroupModel(name: "Discovery Science", avatar: UIImage(named: "discoveryScience")!),
            GroupModel(name: "Animal Planet", avatar: UIImage(named: "animalPlanet")!),
            GroupModel(name: "Discovery Knowledge", avatar: UIImage(named: "discoveryKnowledge")!),
        ]
        allGroups = [
            GroupModel(name: "Nat Geo Wild", avatar: UIImage(named: "natGeoWild")!),
            GroupModel(name: "Science", avatar: UIImage(named: "science")!),
            GroupModel(name: "Investigation Discovery", avatar: UIImage(named: "investigationDiscovery")!),
            GroupModel(name: "Military History", avatar: UIImage(named: "militaryHistory")!),
            GroupModel(name: "National Geografic", avatar: UIImage(named: "nationalGeographic")!),
            GroupModel(name: "Discovery Science", avatar: UIImage(named: "discoveryScience")!),
            GroupModel(name: "Animal Planet", avatar: UIImage(named: "animalPlanet")!),
            GroupModel(name: "Discovery Knowledge", avatar: UIImage(named: "discoveryKnowledge")!),
        ]
    }
}
