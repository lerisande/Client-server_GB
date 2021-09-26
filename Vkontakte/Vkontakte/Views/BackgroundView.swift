//
//  BackgroundView.swift
//  Vkontakte
//
//  Created by Lera on 01.08.21.
//


import UIKit

final class BackgroundView: UIView {

    var shadowColor: UIColor = UIColor.black
    var shadowRadius: CGFloat = 10
    var shadowOpacity: Float = 1


    // Вызов когда макет загружен
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackgroundView()
    }

    //Вызов когда размеры макета подсчитаны и установлены
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.width / 2
    }

    private func setBackgroundView() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize.zero
    }

}



