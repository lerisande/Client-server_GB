//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendsController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var lettersControl: LettersControl!
    
    var friendsSection = [[FriendModel]]() //массив массивов
    private var firstLetters: [String] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        let friends = FriendStorage().friends.sorted(by: { $0.name < $1.name })
        firstLetters = getFirstLetters(friends)
        lettersControl.setLetters(firstLetters)
        lettersControl.addTarget(self, action: #selector(scrollToLetter), for: .valueChanged)
        
        // используем наш метод сортировки и записываем результат
        friendsSection = sortedForSection(friends, firstLetters: firstLetters)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        // регистрируем header
        tableView.register(FriendHeaderSection.self,
                           forHeaderFooterViewReuseIdentifier: FriendHeaderSection.reuseIdentifier)
    }
    
    // MARK: Filters
    
    @objc func scrollToLetter() {
        let letter = lettersControl.selectLetter
        //в нашем массиве friendsSection, который разбит по секциям, мы ищем первый индекс этих массивов, в котором будет массив ($0),его первый элемент, имя первого элемента и первую букву этого элемента -> сравниваем его с той буквой, которая была выбрана на lettersControl
        guard
            let firstIndexForLetter = friendsSection.firstIndex(where: { String($0.first?.name.prefix(1) ?? "") == letter })
        else {
            return
        }
        // скролл до выбранной секции
        tableView.scrollToRow(
            at: IndexPath(row: 0, section: firstIndexForLetter),
            at: .top,
            animated: true)
    }
    
    private func getFirstLetters(_ friends: [FriendModel]) -> [String] {
        let friendName = friends.map { $0.name }
        let firstLetters = Array(Set(friendName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }
    
    // метод сортировки: принимаем массив друзей, первые буквы и возвращаем массив массивов друзей
    private func sortedForSection(_ friends: [FriendModel], firstLetters: [String]) -> [[FriendModel]] {
        var friendsSorted: [[FriendModel]] = []
        // сюда по очереди попадает каждая буква из массива firstLetters[String]
        firstLetters.forEach { letter in
            //затем мы фильтруем массив FriendModel и оставляем там только те имена, у которых имя начинается на букву letter
            let friendsForLetter = friends.filter { String($0.name.prefix(1)) == letter }
            friendsSorted.append(friendsForLetter)
        }
        return friendsSorted
    }

    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendPhotos" {
            guard let destination = segue.destination as? FriendPhotosController else { return }
            destination.friend = sender as? FriendModel
        }
    }
}

    // MARK: Extensions

extension FriendsController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        friendsSection.count //количество секций = количество букв
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsSection[section].count // количество строк в секции = количество элементов в массиве под индексом секции
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier, for: indexPath) as? FriendCell
        else {
            return UITableViewCell()
        }
        let friend = friendsSection[indexPath.section][indexPath.row] //сначала определяем в каком массиве находится, затем ячейку
        cell.configure(name: friend.name, image: friend.avatar)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendHeaderSection.reuseIdentifier) as? FriendHeaderSection else { return nil }
        header.configure(title: firstLetters[section])
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friendsSection[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "showFriendPhotos", sender: friend)
    }
}
