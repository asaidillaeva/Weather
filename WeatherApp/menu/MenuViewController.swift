//
//  MenuViewController.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 27/6/22.
//

import UIKit

enum MenuState{
    case opened
    case closed
}

class MenuViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view =  UITableView()
        view.register(LocationCell.self, forCellReuseIdentifier: LocationCell.identifier)
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textColor = .white
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSettings))
        label.addGestureRecognizer(tap)
        label.font = UIFont.boldSystemFont(ofSize: 14)

        return label
    }()
    private lazy var shareLabel: UILabel = {
        let label = UILabel()
        label.text = "Share this app"
        label.textColor = .white
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapShare))
        label.addGestureRecognizer(tap)
        label.font = UIFont.boldSystemFont(ofSize: 14)

        return label
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.text = "Rate this app"
        label.textColor = .white
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapRate))
        label.addGestureRecognizer(tap)
        label.font = UIFont.boldSystemFont(ofSize: 14)

        return label
    }()
    
    private var locations: [String] = ["Add Location", "Berlin, Germany", "Liverpool, UK", "Washington, USA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setup()
    }
    
    private func setup(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        let colorTop = UIColor(red: 0.236, green: 0.435, blue: 0.821, alpha: 1).cgColor
        let colorBottom = UIColor(red: 0.488, green: 0.662, blue: 1, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        gradientLayer.cornerRadius = 20
        gradientLayer.masksToBounds = true
        self.view.layer.insertSublayer(gradientLayer, at:0)

        stack.addArrangedSubview(settingsLabel)
        stack.addArrangedSubview(shareLabel)
        stack.addArrangedSubview(rateLabel)
        
        view.addSubview(tableView)
        view.addSubview(stack)
        tableView.becomeFirstResponder()
        
    }
    
    
    private func setupConstraints() {
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 120),
            tableView.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: 20),
            
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            stack.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func didTapSettings(){
        print("You tapped settings")
    }

    @objc func didTapShare(){
        print("You tapped share")

    }

    @objc func didTapRate(){
        print("You tapped rate")

    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.identifier, for: indexPath) as? LocationCell
        if indexPath.section == 0 {
            cell?.setData(font: UIFont.boldSystemFont(ofSize: 16.0), location: "Berlin, Germany")
        } else {
            if indexPath.row == 0{
                cell?.setYellow()
            } else {
                cell?.setData(location: locations[indexPath.row])
            }
        }
        cell?.backgroundColor = UIColor(white: 1, alpha: 0)
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped at section \(indexPath.section) and row \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Poppins-Regular", size: 14)
        view.text = "Current Location"
        return view
        } else {
            let view = UILabel()
            view.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            return view
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 4
    }
    
}
