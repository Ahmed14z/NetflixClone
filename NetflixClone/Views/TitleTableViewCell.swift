//
//  TitleTableViewCell.swift
//  NetflixClone
//
//  Created by Ahmed Eslam on 20/02/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    
    private let playTitleButtom : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName:"play.circle",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let titlePosterUIImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButtom)
        
        applyConstraints()
    }
    private func applyConstraints(){
        let titlePosterUIImageViewConstraints = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant:  100)
            
        ]
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let playTitleButtonConstraints = [
        
            playTitleButtom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            playTitleButtom.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraints)
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    public func configure (with model : TitleViewModel){
       
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\( model.posterURL)") else {
            return
        }
        
        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
