//
//  MyGroupsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class MyGroupsController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    let groupsAPI = GroupsAPI()
    
    var groups: [GroupModel] = [] {
        didSet {
            groupsDuplicate = groups
        }
    }
    var groupsDuplicate:[GroupModel] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsAPI.getGroups { groups in }
        
        let storage = GroupStorage()
        groups = storage.groups
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        groupsDuplicate = groups
        
        
        tableView.register(UINib(nibName: GroupsCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: GroupsCell.reuseIdentifier)

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
        
        if !groups.contains(where: {$0.name == group.name}) {
            groups.append(group)
            tableView.reloadData()
        }
    }
}

    // MARK: Extensions

extension MyGroupsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsDuplicate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.reuseIdentifier, for: indexPath) as? GroupsCell
        else {
            return UITableViewCell()
        }
        let group = groupsDuplicate[indexPath.row]
        cell.configure(group: group)
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

extension MyGroupsController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        groupsDuplicate = groups
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        groupsDuplicate = searchText.isEmpty ? groups : groups.filter({ (group) -> Bool in
            return group.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil)
            != nil
        })
        tableView.reloadData()
    }
}
