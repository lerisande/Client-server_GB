//
//  AllGroupsController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit
import Foundation

final class AllGroupsController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    let searchGroupsAPI = SearchGroupsAPI()
    
    var groups: [GroupModel] = [] {
        didSet {
            groupsDuplicate = groups
        }
    }
    
    var groupsDuplicate:[GroupModel] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchGroupsAPI.searchGroups { groups in }
        
        groups = GroupStorage().allGroups
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        groupsDuplicate = groups
        
        tableView.register(UINib(nibName: GroupsCell.reuseIdentifier,
                                 bundle: nil),
                                 forCellReuseIdentifier: GroupsCell.reuseIdentifier)
    }
}

    // MARK: Extensions

extension AllGroupsController: UITableViewDataSource {
    
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
}

extension AllGroupsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "addThisGroup", sender: self)
    }
}

extension AllGroupsController: UISearchBarDelegate {

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


