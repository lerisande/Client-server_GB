//
//  PhotoCell.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCell"
    
    // замыкание в ячейке
    var likeTapped: (() -> Void)?
    
    // MARK: Outlets
    
    @IBOutlet var friendPhoto: UIImageView!
    
    
	var likeControl = LikeControl()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

	override func layoutSubviews() {
		super.layoutSubviews()
		likeControl.frame = CGRect(x: self.frame.size.width - 40,
								   y: self.frame.size.height - 30,
								   width: 38,
								   height: 28)
		self.addSubview(likeControl)
	}
    
    // MARK: Configure
    
    // конфигурируем контрол и замыкание
    func configure(photoModel: PhotoModel) {
		likeControl.configure(
			isLike: photoModel.isLiked,
			likeCount: photoModel.likeCount)
		friendPhoto.image = photoModel.image
        // у likeControl есть состояние controlTapped, в этом замыкании вызываем замыкание в ячейке
		likeControl.controlTapped = { [weak self] in
			self?.likeTapped?()
		}
    }
}
