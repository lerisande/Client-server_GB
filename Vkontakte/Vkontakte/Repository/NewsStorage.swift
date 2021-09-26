//
//  NewsStorage.swift
//  Vkontakte
//
//  Created by Lera on 23.07.21.
//

import Foundation
import UIKit

class NewsStorage {
    let news: [NewsModel]
    
    init() {
        news = [
            NewsModel(avatar: (UIImage(named: "animalPlanet")!),
                      name: "Animal Planet",
                      date: "26.07.2021",
                      text: "These tiny, bunny-faced animals have an unusual strategy for surviving the winter. After 13 years, scientists may have solved a long-standing enigma about the plateau pika of Central Asia. To avoid the harsh temperatures and lack of food that come with colder weather, some animals migrate. Others hibernate. But the pikas of the Qinghai-Tibetan Plateau in northwestern China do neither.",
                      image: (UIImage(named: "plateauPika")!),
                      likes: UInt(UInt.random(in: 0..<255)),
                      comments: UInt.random(in: 0..<155),
                      replies: UInt.random(in: 0..<155),
                      views: UInt.random(in: 0..<255)),
            NewsModel(avatar: (UIImage(named: "discoveryScience")!),
                      name: "Discovery Science",
                      date: "25.07.2021",
                      text: "What You Need to Know About Blue Origin’s Launch into Space with Billionaire Jeff Bezos. The Shepard rocket and capsule will carry four passengers to space and then back to Earth within 11 minutes. It's an automated system which means there will not be a pilot on board. The crew includes Jeff Bezos, Mark Bezos, Mary Wallace “Wally” Funk, and Oliver Daemon.",
                      image: (UIImage(named: "blueOrigin")!),
                      likes: UInt.random(in: 0..<255),
                      comments: UInt.random(in: 0..<155),
                      replies: UInt.random(in: 0..<155),
                      views: UInt.random(in: 0..<255)),
            NewsModel(avatar: (UIImage(named: "militaryHistory")!),
                      name: "Military History",
                      date: "22.07.2021",
                      text: "Barbarossa – the biggest invasion in history.Eighty years ago this year, the German Nazis mounted the greatest invasion in history. Napoleon had invaded Russia in 1812 with an army of 685,000 men. Hitler did so in 1941 with more than five times that number. The Russians, taken by surprise, were outnumbered, outclassed, and outgeneralled. They almost lost Moscow.",
                      image: (UIImage(named: "barbarossa")!),
                      likes: UInt.random(in: 0..<255),
                      comments: UInt.random(in: 0..<155),
                      replies: UInt.random(in: 0..<155),
                      views: UInt.random(in: 0..<255))
        ]
    }
}
