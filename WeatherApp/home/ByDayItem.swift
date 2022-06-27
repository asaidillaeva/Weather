//
//  ByDayItem.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 27/6/22.
//

import Foundation
import UIKit

class ByDayItem: UIView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillProportionally
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var degreeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .init(named: "darkBlue")
        view.font = .init(name: "Poppins-Regular", size: 14)
        view.text = "fuck"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayLabel: UILabel = {
        let view = UILabel()
        view.textColor = .init(named: "darkBlue")
        view.font = .init(name: "Poppins-Regular", size: 12)
        view.text = "Sunday"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        backgroundColor = .white
        addSubview(stackView)
        stackView.spacing = 10
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(degreeLabel)
    }
    
    private func setupConstraints() {
        layoutIfNeeded()
        let contraints = createConstraints {
            stackView.topAnchor.constraint(equalTo: topAnchor)
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            imageView.heightAnchor.constraint(equalToConstant: 30)
            imageView.widthAnchor.constraint(equalToConstant: 30)
            
            dayLabel.widthAnchor.constraint(equalToConstant: dayLabel.intrinsicContentSize.width)
            
            degreeLabel.widthAnchor.constraint(equalToConstant:
                                                    degreeLabel.intrinsicContentSize.width + 20)
        }
        NSLayoutConstraint.activate(contraints)
    }
    
    func set(image: String!, degree: String!, day: String!) {
        imageView.image = .init(named: image)
        degreeLabel.text = degree
        dayLabel.text = day
    }
}
