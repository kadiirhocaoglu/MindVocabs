//
//  UnitsViewController.swift
//  MindVocabs
//
//  Created by Kadir Hocaoğlu on 12.10.2023.
//

import UIKit

class UnitsViewController: UIViewController {
    var units = ["Unite 1","Unite 2","Unite 3","Unite 4","Unite 5","Unite 6","Unite 7"]
    
    private let unitsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(unitsTableView)
        unitsTableView.delegate = self
        unitsTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        unitsTableView.frame = view.bounds
    }
}

extension UnitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = units[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = UnitDetailsViewController()
        vc.title = units[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
