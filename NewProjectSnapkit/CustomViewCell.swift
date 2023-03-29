//
//  CustomViewCell.swift
//  NewProjectSnapkit
//
//  Created by Nurlan Seitov on 29/3/23.
//

import UIKit
import SnapKit
import Kingfisher

class CustomCell: UITableViewCell {
    
    static let idCell = "CustomCell"
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    } ()
    
    private lazy var descriptionLabel: UILabel = {
        let descr = UILabel()
        descr.font = .boldSystemFont(ofSize: 11)
        descr.numberOfLines = 5
        descr.textAlignment = .justified
        return descr
    } ()
    
    private lazy var imageOfNews: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    } ()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    } ()
       
//    private lazy var authorLabel: UILabel = {
//        let author = UILabel()
//        author.font = .boldSystemFont(ofSize: 11)
//        author.numberOfLines = 5
//        author.textAlignment = .justified
//        return author
//    } ()
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
       
        self.addSubview(imageOfNews)
        imageOfNews.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(140)
        }
        
        imageOfNews.layer.cornerRadius = imageOfNews.frame.height / 2.5
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        
        self.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(0.3)
        }
        
    }
    
    func configure(with: Article) {
        self.titleLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.imageOfNews.kf.setImage(with: URL(string: with.urlToImage!))
//        handleImage(url: with.urlToImage!)
        
    }
    
//    private func handleImage(url: String) {
//        let url = URL(string: url)
//        self.imageOfNews.kf.setImage(with: url)
//    }
    
}
