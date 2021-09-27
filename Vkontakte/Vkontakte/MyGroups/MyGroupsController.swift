//
//  MyGroupsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit
import SDWebImage

final class MyGroupsController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private var tableView: UITableView!
    
    let groupsAPI = GroupsAPI()
    
    var groups: [GroupList] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsAPI.getGroups { groups in }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: GroupsCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: GroupsCell.reuseIdentifier)
        
        //Получаем список групп, добавляем их в таблицу
        groupsAPI.getGroups { [weak self] users in
            guard let self = self else { return }
            
            // сохраняем в groups
            guard let users = users else { return }
            self.groups = users
            self.tableView.reloadData()
        }
    }
    
    // MARK: Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGroup" {
            segue.destination.title = "Все группы"
        }
    }
    
    @IBAction func addGroup (segue: UIStoryboardSegue){
        guard
            segue.identifier == "addThisGroup",
            let sourceController = segue.source as? AllGroupsController,
            let indexPath = sourceController.tableView.indexPathForSelectedRow
        else { return }
        let group = sourceController.groups[indexPath.row]
    }
}

    // MARK: TableView Extensions

extension MyGroupsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return groupsDuplicate.count
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.reuseIdentifier, for: indexPath) as? GroupsCell else { return UITableViewCell() }
        
        let group = groups[indexPath.row]
        
        // отображаем группы
        cell.groupName.text = group.name
        cell.groupAvatar?.sd_setImage(with: URL(string: group.image), placeholderImage: UIImage())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MyGroupsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
