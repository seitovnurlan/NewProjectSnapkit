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
    
//    private let cellID = "cell"
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    } ()
    
    private var timeData: [Article] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .cyan
        
        title = "Some news"
       
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomCell.idCell)
//        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.idCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CustomCell.idCell)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
           // make.leading.trailing.top.bottom.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(65)
            make.leading.trailing.bottom.equalToSuperview()
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
                print(" Ошибка!")
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.idCell) as! CustomCell
        
        let value = timeData[indexPath.row]
        
        cell.configure(with: value)
        
//        cell.initUI(theme: news[indexPath.row].matter, infoTheme: news[indexPath.row].imageInfo, image: news[indexPath.row].imageInfo)
//
//        cell.imageCustom.layer.cornerRadius = 20
//        cell.imageCustom.layer.borderWidth = 1
//        cell.imageCustom.layer.borderColor = UIColor.gray.cgColor
//        cell.imageCustom.clipsToBounds = true
//        cell.labelCustom.textColor = .black
//       // cell.labelCustom.font = UIFont.TextStyle.largeTitle
//        cell.labelCustomText.textColor = .black
//
//        cell.labelCustom?.text = news[indexPath.row].matter
//        cell.labelCustomText?.text = news[indexPath.row].info
//        cell.imageCustom?.image = UIImage(named: news[indexPath.row].imageInfo)
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let secondVC = SecondViewController()
//        secondVC.item = timeData[indexPath.row]
        self.navigationController?.pushViewController(secondVC, animated: true)
//        secondVC.name = news[indexPath.row].matter
//        secondVC.infoName = news[indexPath.row].info
//        secondVC.imageName = news[indexPath.row].imageInfo
    }
}
