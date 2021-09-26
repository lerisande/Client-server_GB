//
//  FriendCell.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendCell"
    
    // MARK: Outlets
    
    @IBOutlet var friendAvatar: UIImageView!{
        didSet {
            // включаем поддержку тапа
            friendAvatar.isUserInteractionEnabled = true
            // настраиваем распознаватель тапа по аватару
            let tapRecognizer = UITapGestureRecognizer(target: self,
                                                       action: #selector(animateAvatar))
            friendAvatar.addGestureRecognizer(tapRecognizer)
        }
    }
    
    @IBOutlet var friendFirstName: UILabel!
    @IBOutlet var friendLastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    /* производим изменения после того, как вся геометрия расчитана
    (corner radius лучше высчитывать тут) */
    override func layoutSubviews() {
        super.layoutSubviews()

        friendAvatar.layer.cornerRadius = friendAvatar.frame.size.width / 2
    }
    
    // MARK: Configure
    
    func configure(friend: FriendList) {
        //self.friendFirstName.text = "\(friend.firstName) \(friend.lastName)"
        //friendAvatar.image = UIImage(named: friend.photo)
//        friendAvatar.image = image
//        friendName.text = name
    }
    
    private func setupView() {
        friendAvatar.contentMode = .scaleAspectFill
        friendAvatar.clipsToBounds = true
        friendAvatar.layer.borderWidth = 1
        friendAvatar.layer.borderColor = UIColor.black.cgColor
    }
    
    // добавляем анимацию по тапу на аватар друга
    @objc private func animateAvatar(_ sender: UITapGestureRecognizer) {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 200 //жесткость
        animation.mass = 1 // масса слоя
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.friendAvatar.layer.add(animation, forKey: nil)
    }
}
