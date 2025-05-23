//
//  TeamHeader.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 23/5/25.
//
import UIKit
import Kingfisher

class TeamHeader: UIView {
    
    private let teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .systemBackground
        
        addSubview(teamLogoImageView)
        addSubview(teamNameLabel)
        
        NSLayoutConstraint.activate([
            teamLogoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            teamLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            teamLogoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            teamLogoImageView.heightAnchor.constraint(equalTo: teamLogoImageView.widthAnchor),
            
            teamNameLabel.topAnchor.constraint(equalTo: teamLogoImageView.bottomAnchor, constant: 16),
            teamNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            teamNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            teamNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with teamName: String, logoUrl: String?) {
        teamNameLabel.text = teamName
        if let logoUrl = logoUrl{
            teamLogoImageView.kf.setImage(with: URL(string: logoUrl), placeholder: Utils.placeHolder)
        }
    }
}


