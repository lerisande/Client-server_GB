//
//  NewsCell.swift
//  Vkontakte
//
//  Created by Lera on 20.07.21.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsCell"
    
    // MARK: Outlets
    
    @IBOutlet var newsAvatar: UIImageView!
    @IBOutlet var newsName: UILabel!
    @IBOutlet var newsPostDate: UILabel!
    @IBOutlet var newsText: UITextView!
    @IBOutlet var newsImage: UIImageView!
    
    @IBOutlet var likeButton: UIButton!
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
        newsImage.image = news.image
        
        likeLabel.text = String(news.likes)
        commentLabel.text = String(news.comments)
        replyLabel.text = String(news.replies)
        viewsLabel.text = String(news.views)
     }
}
