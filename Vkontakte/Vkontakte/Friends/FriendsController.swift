//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit
import SDWebImage

final class FriendsController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // массив с друзьями
    var friends = [FriendList]()
    
    let friendsAPI = FriendsAPI()
    
    // MARK: Life cycle
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        friendsAPI.getFriends { [weak self] users in
            guard let self = self else { return }
            
            // сохраняем в массив friends
            guard let friend = users else { return }
            self.friends = friend
            
            // перезагружаем таблицу
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    // MARK: Filters
    
//    @objc func scrollToLetter() {
//        let letter = lettersControl.selectLetter
//        //в нашем массиве friendsSection, который разбит по секциям, мы ищем первый индекс этих массивов, в котором будет массив ($0),его первый элемент, имя первого элемента и первую букву этого элемента -> сравниваем его с той буквой, которая была выбрана на lettersControl
//        guard
//            let firstIndexForLetter = friendsSection.firstIndex(where: { String($0.first?.name.prefix(1) ?? "") == letter })
//        else {
//            return
//        }
//        // скролл до выбранной секции
//        tableView.scrollToRow(
//            at: IndexPath(row: 0, section: firstIndexForLetter),
//            at: .top,
//            animated: true)
//    }
//
//    private func getFirstLetters(_ friends: [FriendModel]) -> [String] {
//        let friendName = friends.map { $0.name }
//        let firstLetters = Array(Set(friendName.map { String($0.prefix(1)) })).sorted()
//        return firstLetters
//    }
    
//    // метод сортировки: принимаем массив друзей, первые буквы и возвращаем массив массивов друзей
//    private func sortedForSection(_ friends: [FriendModel], firstLetters: [String]) -> [[FriendModel]] {
//        var friendsSorted: [[FriendModel]] = []
//        // сюда по очереди попадает каждая буква из массива firstLetters[String]
//        firstLetters.forEach { letter in
//            //затем мы фильтруем массив FriendModel и оставляем там только те имена, у которых имя начинается на букву letter
//            let friendsForLetter = friends.filter { String($0.name.prefix(1)) == letter }
//            friendsSorted.append(friendsForLetter)
//        }
//        return friendsSorted
//    }

    // MARK: Segue
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showFriendPhotos" {
//            guard let destination = segue.destination as? FriendPhotosController else { return }
//            destination.friend = sender as? FriendModel
//        }
//    }
}

    // MARK: Extensions

extension FriendsController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier, for: indexPath) as? FriendCell else { return UITableViewCell() }
        
        // берем друга из массива по indexPath
        let friend = friends[indexPath.row]
        
        // отображаем имя,фамилию и аватарку
        cell.friendFirstName.text = "\(friend.firstName)"
        cell.friendLastName.text = "\(friend.lastName)"
        cell.friendAvatar?.sd_setImage(with: URL(string: friend.photo), placeholderImage: UIImage())
    
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showFriendPhotos", sender: nil)
    }
}
