//
//  FriendHeaderSections.swift
//  Vkontakte
//
//  Created by Lera on 22.07.21.
//

import UIKit

//final class FriendHeaderSection: UITableViewHeaderFooterView {
//
//    static let reuseIdentifier = "FriendHeaderSection"
//
//    private let label: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false // включает констрейнты из кода
//        label.textAlignment = .center
//        label.textColor = .gray
//        return label
//    } ()
//
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        setView()
//    }
//
//    // исп. когда создаем в коде
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setView()
//    }
//
//    // исп. когда создаем в сториборде
//    func configure(title: String?) {
//        label.text = title
//    }
//
//    private func setView() {
//        contentView.addSubview(label)
//        // задаем констрейнты кодом
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//        ])
//    }
//}

