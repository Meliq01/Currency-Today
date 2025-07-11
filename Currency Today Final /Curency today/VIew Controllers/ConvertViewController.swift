//
//  ConvertViewController.swift
//  Curency today
//
//  Created by Student on 02.07.25.
//

import UIKit

class ConvertOption{
    var name: String
    var bgimg: UIImage
    var bgcolor: UIColor
    var api: String
    init(name: String, bgimg: UIImage, bgcolor: UIColor,api: String) {
        self.name = name
        self.bgimg = bgimg
        self.bgcolor = bgcolor
        self.api = api
    }
}

class ConvertViewController: UIViewController {
    
    var models = [ConvertOption]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ConvertTableViewCell.self, forCellReuseIdentifier: ConvertTableViewCell.identifier)
        
        configure()
    }
    
    func configure(){
        models .append(contentsOf: [
            ConvertOption(name: "AMD", bgimg: UIImage(named: "Armenia")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/AMD"),
            ConvertOption(name: "RUB", bgimg: UIImage(named: "Russia")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/RUB"),
            ConvertOption(name: "USD", bgimg: UIImage(named: "USA")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/USD"),
            ConvertOption(name: "EUR", bgimg: UIImage(named: "Europe")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/EUR"),
            ConvertOption(name: "GEL", bgimg: UIImage(named: "Georgia")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/GEL"),
            ConvertOption(name: "KZT", bgimg: UIImage(named: "Kazakhstan")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/KZT"),
            ConvertOption(name: "AED", bgimg: UIImage(named: "UAE")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/AED"),
            ConvertOption(name: "ARS", bgimg: UIImage(named: "Argentina")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/ARS"),
            ConvertOption(name: "AUD", bgimg: UIImage(named: "Australia")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/AUD"),
            ConvertOption(name: "BYN", bgimg: UIImage(named: "Belarus")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/BYN"),
            ConvertOption(name: "BRL", bgimg: UIImage(named: "Brazil")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/BRL"),
            ConvertOption(name: "CAD", bgimg: UIImage(named: "Canada")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/CAD"),
            ConvertOption(name: "CNY", bgimg: UIImage(named: "China")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/CNY"),
            ConvertOption(name: "DKK", bgimg: UIImage(named: "Denmark")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/DKK"),
            ConvertOption(name: "IRR", bgimg: UIImage(named: "Iran")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/IRR"),
            ConvertOption(name: "MDL", bgimg: UIImage(named: "Moldova")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/MDL"),
            ConvertOption(name: "NOK", bgimg: UIImage(named: "Norway")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/NOK"),
            ConvertOption(name: "SEK", bgimg: UIImage(named: "Sweden")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/SEK"),
            ConvertOption(name: "UAH", bgimg: UIImage(named: "Ukraine")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/UAH"),
            ConvertOption(name: "GBP", bgimg: UIImage(named: "United Kingdom")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/GBP"),
            ConvertOption(name: "UYU", bgimg: UIImage(named: "Uruguay")!, bgcolor: .systemCyan, api: "https://open.er-api.com/v6/latest/UYU"),
            

            
            

        ])
    }
    
    @IBAction func home(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourceViewController") as? CourceViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    
    }
    
  
    
    
   
    @IBAction func settings(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
            vc?.modalTransitionStyle = .crossDissolve
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
    }

    

}

extension ConvertViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConvertTableViewCell.identifier, for: indexPath) as?
        ConvertTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        if models[indexPath.item].name != ""{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ChangeViewController") as! ChangeViewController
            vc.ap = models[indexPath.item].api
            vc.text = models[indexPath.item].name
            self.present(vc,animated: true)
        }
    }
    
}
