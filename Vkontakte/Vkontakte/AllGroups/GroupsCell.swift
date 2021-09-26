//
//  AllGroupsCell.swift
//  Vkontakte
//
//  Created by Lera on 22.07.21.
//

import UIKit

final class GroupsCell: UITableViewCell {
    
    static let reuseIdentifier = "GroupsCell"
    
    // MARK: Outlets
    
    @IBOutlet var groupAvatar: UIImageView!{
        didSet {
            // включаем поддержку тапа
            groupAvatar.isUserInteractionEnabled = true
            // настраиваем распознаватель тапа по аватару
            let tapRecognizer = UITapGestureRecognizer(target: self,
                                                       action: #selector(animateAvatar))
            groupAvatar.addGestureRecognizer(tapRecognizer)
        }
    }
    @IBOutlet var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    /* производим изменения после того, как вся геометрия расчитана
    (corner radius лучше высчитывать тут) */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        groupAvatar.layer.cornerRadius = groupAvatar.frame.size.width / 2
    }
    
    // MARK: Configure
    
    /// - Parameter group: Модель группы
    func configure(group: GroupModel) {
        groupName.text = group.name
        groupAvatar.image = group.avatar
    }
    
    private func setupView() {
        // настраиваем внешний вид аватара
        groupAvatar.contentMode = .scaleAspectFill
        groupAvatar.clipsToBounds = true
        groupAvatar.layer.borderWidth = 1
        groupAvatar.layer.borderColor = UIColor.black.cgColor
    }
    
    // добавляем анимацию по тапу на аватар группы
    @objc private func animateAvatar(_ sender: UITapGestureRecognizer) {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.groupAvatar.layer.add(animation, forKey: nil)
    }
    
}


