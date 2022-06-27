//
//  WeekWeatherCell.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 27/6/22.
//

import Foundation
import UIKit

class WeekWeatherCell: UITableViewCell{
    
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
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fillEqually
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
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(weatherLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(filterImage)
        contentView.addSubview(stack)
        
        addViewToStack(image: "sun", degree: "72/28", day: "Monday")
        addViewToStack(image: "sunCloud", degree: "73/27", day: "Tuesday")
        addViewToStack(image: "cloud", degree: "73/26", day: "Wednesday")
        addViewToStack(image: "sunRain", degree: "73/22", day: "Thursday")
        addViewToStack(image: "rain", degree: "73/25", day: "Friday")
        addViewToStack(image: "rain", degree: "68/22", day: "Saturday")

    }
    
    func addViewToStack(image: String, degree: String, day: String){
        let subView = ByDayItem()
        subView.set(image: image, degree: degree, day: day)
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
            
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
            stack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 23)
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26)
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
extension WeekWeatherCell {
    static var identifier: String {
        .init(describing: self)
    }
}
