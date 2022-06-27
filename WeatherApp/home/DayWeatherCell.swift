//
//  DayWeatherCell.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 26/6/22.
//

import Foundation
import UIKit

class DayWeatherCell: UITableViewCell{
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(red: 0.627, green: 0.596, blue: 0.682, alpha: 1)
        label.font = .init(name: "Poppins-Regular", size: 14)
        label.text = "Partly Cloudly"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(named: "darkBlue")
        label.font = .init(name: "Poppins-SemiBold", size: 16)
        label.text = "August, 10th 2022"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var filterImage: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "filter")
        view.tintColor = .init(named: "darkBlue")
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

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
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(weatherLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(filterImage)
        contentView.addSubview(stack)
    
        addViewToStack(image: "sun", degree: "72 F", time: "2 PM")
        addViewToStack(image: "sunCloud", degree: "70 F", time: "3 PM")
        addViewToStack(image: "sunRain", degree: "69 F", time: "4 PM")
        addViewToStack(image: "cloud", degree: "75 F", time: "5 PM")
        addViewToStack(image: "rain", degree: "76 F", time: "6 PM")
     
    }
    
    func addViewToStack(image: String!, degree: String!, time: String!){
        let subView = ByHourItem()
        subView.set(
            image: .init(named: image),
            degree: degree,
            time: time
        )
        stack.addArrangedSubview(subView)
    }
    
    private func setupConstraints() {
        let constraints = createConstraints {
            weatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
            weatherLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22)
            weatherLabel.heightAnchor.constraint(equalToConstant: 21)
            weatherLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor)
        
            dateLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 8)
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
            dateLabel.heightAnchor.constraint(equalToConstant: 24)
            dateLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor)
            
            filterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29)
            filterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 44)
            filterImage.heightAnchor.constraint(equalToConstant: 14)
            filterImage.widthAnchor.constraint(equalToConstant: 10)
            
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
            stack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 23)
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26)
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func setData(){
        weatherLabel.text = "Partly Cloudy"
        dateLabel.text = "August, 10th 2022"
        
    }
}

extension DayWeatherCell {
    static var identifier: String {
        .init(describing: self)
    }
}
