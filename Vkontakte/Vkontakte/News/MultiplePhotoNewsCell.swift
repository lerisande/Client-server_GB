//
//  MultiplePhotoNewsCell.swift
//  Vkontakte
//
//  Created by Lera on 01.08.21.
//

import UIKit

final class MultiplePhotoNewsCell: UITableViewCell {
    
    static let reuseIdentifier = "MultiplePhotoNewsCell"
    
    var index: Int = 0
    
    // MARK: Outlets
    
    @IBOutlet var newsAvatar: UIImageView!
    @IBOutlet var newsName: UILabel!
    @IBOutlet var newsPostDate: UILabel!
    @IBOutlet var newsText: UITextView!
   
    @IBOutlet var horizontalStackView: UIStackView!
    @IBOutlet var verticalStackView1: UIStackView!
    @IBOutlet var verticalStackView2: UIStackView!

    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var image4: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var replyButton: UIButton!
    @IBOutlet var replyLabel: UILabel!
    @IBOutlet var viewsButton: UIButton!
    @IBOutlet var viewsLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }
    
    // MARK: Configure
    
    func configure(news: NewsModel) {
        newsAvatar.image = news.avatar
        newsName.text = news.name
        newsPostDate.text = news.date
        newsText.text = news.text
        //newsImage.image = news.image
        
        likeLabel.text = String(news.likes)
        commentLabel.text = String(news.comments)
        replyLabel.text = String(news.replies)
        viewsLabel.text = String(news.views)
     }
    
    private func generatePhoto() -> UIImage? {
        if Bool.random() {
            return multipleImages.randomElement()
        } else {
            return nil
        }
    }
    
    private let multipleImages = [
        UIImage(named: "animalPlanet1")!,
        UIImage(named: "plateauPika")!,
        UIImage(named: "animalPlanet2")!,
        UIImage(named: "barbarossa")!,
        UIImage(named: "blueOrigin")!,
    ]

}
