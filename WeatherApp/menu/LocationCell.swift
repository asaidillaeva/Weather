//
//  LocationCell.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 27/6/22.
//

import Foundation
import UIKit

class LocationCell: UITableViewCell {
    
    private let locationImage: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "location")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let locationLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Berlin, Germany"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        contentView.addSubview(locationImage)
        contentView.addSubview(locationLabel)
    }
    
    private func setupConstraints() {
        let constraints = createConstraints {
            locationImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            locationImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
            locationImage.heightAnchor.constraint(equalToConstant: 20)
            locationImage.widthAnchor.constraint(equalToConstant: 14)
            
            locationLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 13)
            locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
            locationLabel.heightAnchor.constraint(equalToConstant: locationLabel.intrinsicContentSize.height)
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func setData(font: UIFont?, location: String?){
        locationLabel.font = UIFont.boldSystemFont(ofSize: 18)
        locationLabel.text = location
    }
    func setData( location: String?){
        locationLabel.font = UIFont(name: "Poppins-Regular", size: 18)
        locationLabel.text = location
    }
    func setYellow(){
        locationLabel.textColor = UIColor(red: 0.984, green: 0.976, blue: 0.62, alpha: 1)
        locationLabel.text = "Add Location"
        locationLabel.font = .boldSystemFont(ofSize: 18)
        
        locationImage.tintColor = UIColor(red: 0.984, green: 0.976, blue: 0.62, alpha: 1)
        locationImage.image = .init(named: "locationHeader")

    }
}

extension LocationCell {
    static var identifier: String {
        .init(describing: self)
    }
}

