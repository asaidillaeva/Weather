//
//  ByHourItem.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 26/6/22.
//

import Foundation
import UIKit
import KingsCode

class ByHourItem: UIView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fillProportionally
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var degreeLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        view.font = UIFont(name: "Poppins-Regular", size: 14)
        view.text = "fuck"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .init(red: 0.627, green: 0.596, blue: 0.682, alpha: 1)
        view.font = .init(name: "Poppins-Regular", size: 12)
        view.text = "fuck"
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
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(imageView)
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
            
            timeLabel.heightAnchor.constraint(equalToConstant: timeLabel.intrinsicContentSize.height)
            
            degreeLabel.heightAnchor.constraint(equalToConstant:
                                                    degreeLabel.intrinsicContentSize.height)
        }
        NSLayoutConstraint.activate(contraints)
    }
    
    func set(image: UIImage?, degree: String?, time: String?) {
        imageView.image = image
        degreeLabel.text = degree
        timeLabel.text = time
    }
}
