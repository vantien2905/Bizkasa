//
//  LeftMenuViewController.swift
//  CodeBase
//
//  Created DINH VAN TIEN on 2/12/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit
import SDWebImage

class LeftMenuViewController: BaseViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tbLeftMenu: UITableView!
    @IBOutlet weak var lbVersion: UILabel!

    var presenter: LeftMenuPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func setUpViews() {
        guard let user = UserDefaultHelper.shared.getUser() else { return }
        lbName.text = "KHÁCH SẠN " + user.HotelName&.uppercased()
        imgLogo.sd_setImage(with: user.Logo&.convertUrl(), placeholderImage: AppImage.imgPlaceholder)

        lbVersion.text = "Bizkasa @ version \(self.getVersionName()) \n build (\(self.getVersionBuild()))"
    }

    private func getVersionBuild() -> String{
      return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }

    private func getVersionName() -> String{
      return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }

    private func configureTableView() {
        tbLeftMenu.registerTableCell(LeftMenuCell.self)
        tbLeftMenu.delegate = self
        tbLeftMenu.dataSource = self
        tbLeftMenu.rowHeight = 50
    }

    @IBAction func btnLogoutTapped() {
        self.showPopupAlert(title: "Đăng xuất", message: "Bạn có thực sự muốn đăng xuất?", actionTitles: ["Đồng ý", "Huỷ"], actions:  [{ (_) in
            UserDefaultHelper.shared.clearDataUser()
            let vc = LoginRouter.createModule().convertNavi()
            self.view.window?.rootViewController = vc
            }, { (_) in

            }])

    }
}

extension LeftMenuViewController: LeftMenuViewProtocol {

}

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTitle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(LeftMenuCell.self)
        cell.lbTitle.text = listTitle[indexPath.row]
        if indexPath.row == 0 {
            cell.imgLogo.image = AppImage.home
        } else {
            cell.imgLogo.image = listImageTitle[indexPath.row - 1]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setContentVC(index: indexPath.row)
    }
}
