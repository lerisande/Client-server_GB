//
//  LikeControl.swift
//  Vkontakte
//
//  Created by Lera on 14.07.21.
//

import UIKit

final class LikeControl: UIControl {
    
    // замыкание
    var controlTapped: (() -> Void)?
    private var button = UIButton(type: .custom)
    private var quantity = UILabel(frame: CGRect(x: 28, y: 0, width: 10, height: 28))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    //конфигурируем контрол из состояния isLike и кол-ва лайков
    func configure(isLike: Bool, likeCount: Int) {
		quantity.text = "\(likeCount)"
		button.isSelected = isLike
	}
    
    // настройка расположения и внешнего вида контрола
    func setupView() {
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(likeTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(animateLabel(_:)), for: .touchUpInside)
        
        quantity.textColor = .red
        quantity.textAlignment = .left
        quantity.font = .systemFont(ofSize: 12)
        
        self.addSubview(button)
        self.addSubview(quantity)
        
    }
    
    //отправляем событие при нажатии на кнопку - вызывается замыкание
    @objc private func likeTapped(_ sender: UIButton) {
		controlTapped?()
    }

    @objc private func animateLabel(_ sender: UIButton) {
        
        self.quantity.transform = CGAffineTransform(translationX: 0, y: -self.quantity.bounds.height / 1)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveEaseInOut,
                       // сброс в начальное состояние
                       animations: { self.quantity.transform = .identity },
                       completion: nil)
    }
}
