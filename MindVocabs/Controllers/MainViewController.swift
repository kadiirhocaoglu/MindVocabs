//
//  ViewController.swift
//  MindVocabs
//
//  Created by Kadir Hocaoğlu on 12.10.2023.
//

import UIKit

class MainViewController: UIViewController {

    private let packagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "MindVocabs"
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationItem.titleView?.tintColor = .blue
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .done, target: self, action: nil)

        if #available(iOS 13.0, *) {
            if overrideUserInterfaceStyle == .light {
                overrideUserInterfaceStyle = .dark
            }
        }
        //CoreDataCaller.shared.addWords(word: "Hello", mean: "Merhaba")
        //CoreDataCaller.shared.addWords(word: "Hi", mean: "Selam")
        //CoreDataCaller.shared.addWords(word: "You", mean: "Sen")
        CoreDataCaller.shared.getWords()
        //CoreDataCaller.shared.updateWord(word: "Hi", toMean: "Kadir")
        CoreDataCaller.shared.deleteWord(word: "Hi")
        CoreDataCaller.shared.getWords()
        
        view.addSubview(packagesTableView)
        
        packagesTableView.dataSource = self
        packagesTableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        packagesTableView.frame = view.bounds
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Başlangıç Kelimeleri"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UnitsViewController()
        
        vc.title = "Başlangıç Kelimeleri"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: false)
    }
    
}

