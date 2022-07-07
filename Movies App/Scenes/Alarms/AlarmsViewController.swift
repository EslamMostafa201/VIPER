


import UIKit

class AlarmsViewController: UIViewController {
    @IBOutlet weak var emptyAlarmView: UIView!
    @IBOutlet weak var alarmsView: UIView!
    @IBOutlet weak var alarmTableView: UITableView!
    @IBOutlet weak var alarmsTitleLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var addAlarmButton: UILabel!
    @IBOutlet weak var noAlarmsLabel: UILabel!
    @IBOutlet weak var tapBelowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        emptyAlarmView.isHidden = true
        alarmsView.isHidden = true
        setupTableView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Methods
    private func setupTableView() {
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        alarmTableView.register(AlarmTableViewCell.nib, forCellReuseIdentifier: AlarmTableViewCell.identifier)
    }
    
    @IBAction func addAlarmAction(_ sender: UIButton) {
        let vc = AddAlarmViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editAlarmAction(_ sender: UIButton) {
    }
}

// MARK: - TableView Methods
extension AlarmsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmTableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.identifier, for: indexPath) as! AlarmTableViewCell
        return cell
    }
}
