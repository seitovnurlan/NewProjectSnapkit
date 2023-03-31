//
//  ViewController.swift
//  NewProjectSnapkit
//
//  Created by Nurlan Seitov on 28/3/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
//    private lazy var tableView: UITableView = {
//        let view = UITableView()
//        return view
//    } ()
    
    private var tableView = UITableView()
    private var timeData: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupconstr()

    }
    private func setupconstr() {
        
        view.backgroundColor = .systemGray6
        
        title = "Some news"
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomCell.idCell)
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.idCell)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CustomCell.idCell)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
           // make.leading.trailing.top.bottom.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(65)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            }
       
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let `self` else {return}
                    self.timeData = data.articles ?? []
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
      return  timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.idCell) as! CustomCell
        
        let value = timeData[indexPath.row]
        
        cell.configure(with: value)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 145
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let secondVC = SecondViewController()
        secondVC.item = timeData[indexPath.row]
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
