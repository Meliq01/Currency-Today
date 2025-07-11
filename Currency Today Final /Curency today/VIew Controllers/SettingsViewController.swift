import UIKit

class SettingsOption{
    var name: String
    var bgimg: UIImage
    var bgcolor: UIColor
    init(name: String, bgimg: UIImage, bgcolor: UIColor) {
        self.name = name
        self.bgimg = bgimg
        self.bgcolor = bgcolor
    }
}

class SettingsViewController: UIViewController {
    var models = [SettingsOption]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
        configure()
    }
    
    func configure(){
        models.append(contentsOf: [
            SettingsOption(name: "About Programm", bgimg: UIImage(systemName: "info.circle")!, bgcolor: .systemPink),
            SettingsOption(name: "Share", bgimg: UIImage(systemName: "square.and.arrow.up.on.square")!, bgcolor: .systemPink),
            SettingsOption(name: "Contact", bgimg: UIImage(systemName: "person.badge.shield.checkmark")!, bgcolor: .systemPink),
            SettingsOption(name: "By", bgimg: UIImage(systemName: "person.icloud")!, bgcolor: .systemPink)
        ])
    }
    
    
    
    
    
    @IBAction func home(_ sender: Any) {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CourceViewController") as? CourceViewController
            vc?.modalTransitionStyle = .crossDissolve
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
    
    }
    
  
    @IBAction func convert(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConvertViewController") as? ConvertViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
    

}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as?
        SettingsTableViewCell
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
        if models[indexPath.item].name == "About Programm"{
            let alert = UIAlertController(title: "About Programm", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }else if models[indexPath.item].name == "Share"{
                let activityVc = UIActivityViewController(activityItems: [""], applicationActivities: nil)
                activityVc.popoverPresentationController?.sourceView = self.view
                self.present(activityVc, animated: true)
            
        }else if models[indexPath.item].name == "Contact"{
            let action = UIAlertController(title: "Contact", message: nil, preferredStyle: .actionSheet)
            action.addAction(UIAlertAction(title: "Instagram", style: .default, handler: { (action) in UIApplication.shared.openURL(NSURL(string: "")! as URL)
            }))
                action.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                present(action, animated: true)
            }else if models[indexPath.item].name == "By"{
                let alert = UIAlertController(title: "By Meliq Soghomonyan", message: nil, preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
    }
}
}
