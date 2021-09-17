//
//  NewsController.swift
//  Vkontakte
//
//  Created by Lera on 20.07.21.
//

import UIKit

class NewsController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    
    var news = [NewsModel]()
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        news = NewsStorage().news

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: NewsCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: NewsCell.reuseIdentifier)

    }
}

    // MARK: Extensions

extension NewsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath) as? NewsCell
        else {
            return UITableViewCell()
        }
        let news = news[indexPath.row]
        cell.configure(news: news)
        return cell
    }
}
