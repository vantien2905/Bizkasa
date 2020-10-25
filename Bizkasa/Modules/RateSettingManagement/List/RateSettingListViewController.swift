//
//  RateSettingListViewController.swift
//  Bizkasa
//
//  Created Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class RateSettingListViewController: HomeBaseViewController {
    
    @IBOutlet weak var tbRateSetting: UITableView!

	var presenter: RateSettingListPresenterProtocol?
    
    var listRateSetting: [RateSettingEntity] = [] {
        didSet {
            tbRateSetting.reloadData()
        }
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.getRoomClass()
    }
    
    override func setUpNavigation() {
        setTitleNavigation(title: "Cài đặt giá phòng")
    }

    private func configureTableView() {
        tbRateSetting.registerTableCell(RateSettingCell.self)
        tbRateSetting.register(header: HeaderRateSettingCell.self)
        tbRateSetting.delegate = self
        tbRateSetting.dataSource = self
        tbRateSetting.rowHeight = UITableView.automaticDimension
        tbRateSetting.tableFooterView = UIView()
    }
    
    @IBAction func addNewTapped() {
        let vc = AddRateSettingRouter.createModule().convertNavi()
        self.present(controller: vc)
    }
}

extension RateSettingListViewController: RateSettingListViewProtocol {
    func didDeleteRoomClass(result: BaseResponse?, error: APIError?) {
        if let result = result, let data = result.data as? Bool, data {
            presenter?.getRoomClass()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
    
    func didAddRoomClass(result: [RateSettingEntity]?, error: APIError?) {
        if let result = result {
            self.listRateSetting = result
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
    
    func didGetRoomClass(result: [RateSettingEntity]?, error: APIError?) {
        if let result = result {
            self.listRateSetting = result
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
}

extension RateSettingListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listRateSetting.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRateSetting[section].ConfigPrices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(RateSettingCell.self)
        cell.setData(detail: listRateSetting[indexPath.section].ConfigPrices[indexPath.row], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeue(header: HeaderRateSettingCell.self)
        header.setData(detail: listRateSetting[section])
        header.delegate = self
        header.setShadawHeader()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension RateSettingListViewController: UITableViewDelegate {
    
}

extension RateSettingListViewController: HeaderRateSettingCellDelegate {
    func rateSettingAction(type: RateSettingAction, rateSetting: RateSettingEntity) {
        if type == .delete {
            self.showAlert(title: "Xoá", message: "Bạn có chắc chắn muốn xoá?") {
                guard let id = rateSetting.RoomClass?.Id else { return }
                self.presenter?.deleteRoomClass(listID: [id])
            }
        } else {
            let popUp = InfoRateSettingPopUpViewController()
            popUp.rateSetting = rateSetting
            popUp.modalPresentationStyle = .overCurrentContext
            popUp.modalTransitionStyle = .crossDissolve
            popUp.completionYes = {
                guard let param = popUp.getData() else { return }
                self.presenter?.addRoomClass(param: param)
            }
            self.present(controller: popUp)
        }
    }
}

extension RateSettingListViewController: RateSettingCellDelegate {
    func hourButtonTapped(indexPath: IndexPath) {
        guard let priceList = listRateSetting[indexPath.section].ConfigPrices[indexPath.row].ConfigPriceRow?.PriceByDayList else { return }
        let vc = DetailRateSettingRouter.createModule(priceList: priceList).convertNavi()
        self.present(controller: vc)
    }
    
    func moreButtonTapped(indexPath: IndexPath) {
        let moreRateVC = MoreRateSettingRouter.createModule(priceConfigure: listRateSetting[indexPath.section].ConfigPrices[indexPath.row].ConfigPriceRow).convertNavi()
        self.present(controller: moreRateVC)
    }
}