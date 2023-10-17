//
//  UnitDetailsViewController.swift
//  MindVocabs
//
//  Created by Kadir Hocaoğlu on 12.10.2023.
//


import UIKit

class UnitDetailsViewController: UIViewController {
    var words = [
        "forbidden",
        "revolution",
        "worth",
        "important",
        "wrong",
        "purpose",
        "construct, build",
        "continuous",
        "unlike",
        "require",
        "separate",
        "implement",
        "conventional, traditional",
        "however",
        "whatever",
        "describe",
        "publish",
        "phrase",
        "wanted",
        "essential"
    ]
    
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

extension UnitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = WordDetailsViewController()
        vc.modalPresentationStyle = .pageSheet
        vc.title = words[indexPath.row]
        present(vc, animated: true)
    }
    
}
