//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aliia Saidillaeva  on 26/6/22.
//

import UIKit
protocol HomeViewControllerDelegate: AnyObject{
    func didTapMenuButton()
}

class HomeViewController: UIViewController {
    public weak var delegate: HomeViewControllerDelegate?

    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.register(DayWeatherCell.self, forCellReuseIdentifier: DayWeatherCell.identifier)
        view.register(WeekWeatherCell.self, forCellReuseIdentifier: WeekWeatherCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var menuButton: UIButton = {
        let view = UIButton()
        view.setBackgroundImage(UIImage(named: "menu"), for: .normal)
        view.tintColor = .init(named: "darkBlue")
        view.addTarget(self, action: #selector(menu), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let view = UIButton()
        view.setBackgroundImage(UIImage(named: "search"), for: .normal)
        view.tintColor = .init(named: "darkBlue")
        view.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setup()
    }
    
    private func setup(){
        tableView.frame = view.frame
        tableView.backgroundColor = .init(named: "backgroundGrey")
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .lightGray
        self.navigationItem.title =  "Weather"
        view.addSubview(tableView)
        
        navigationItem.leftBarButtonItem = .init(customView: menuButton)
        navigationItem.rightBarButtonItem = .init(customView: searchButton)
        
    }
    
    @objc func menu() {
        print("Clicked Menu")
        delegate?.didTapMenuButton()
    }
    
    @objc func search() {
        print("Clicked Search")
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Forecast"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = .init(named: "darkBlue")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath , animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: DayWeatherCell.identifier, for: indexPath) as! DayWeatherCell
            cell.setData()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: WeekWeatherCell.identifier, for: indexPath) as! WeekWeatherCell
            return cell
        }
        
    }
}

