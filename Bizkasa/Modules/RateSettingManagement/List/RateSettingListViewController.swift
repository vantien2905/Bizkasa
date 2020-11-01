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
import SwipeCellKit

class RateSettingListViewController: HomeBaseViewController {
    
    @IBOutlet weak var tbRateSetting: UITableView!

	var presenter: RateSettingListPresenterProtocol?
    
    var listRateSetting: [RateSettingEntity] = [] {
        didSet {
            tbRateSetting.reloadData()
        }
    }
    
    var buttonDisplayMode: ButtonDisplayMode = .imageOnly
    var buttonStyle: ButtonStyle = .backgroundColor

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
        tbRateSetting.registerTableCell(FooterRateSettingCell.self)
        tbRateSetting.register(header: HeaderRateSettingCell.self)
        tbRateSetting.delegate = self
        tbRateSetting.dataSource = self
        tbRateSetting.rowHeight = UITableView.automaticDimension
        tbRateSetting.tableFooterView = UIView()
        tbRateSetting.contentInset.bottom = 50
    }
    
    @IBAction func addNewTapped() {
        let vc = AddRateSettingRouter.createModule().convertNavi()
        self.present(controller: vc)
    }
}

extension RateSettingListViewController: RateSettingListViewProtocol {
    func didDeleteConfigPrice(result: BaseResponse?, error: APIError?) {
        if let result = result, let data = result.data as? Bool, data {
            presenter?.getRoomClass()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }
    
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
        return listRateSetting[section].ConfigPrices.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == listRateSetting[indexPath.section].ConfigPrices.count {
            let cell = tableView.dequeueTableCell(FooterRateSettingCell.self)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueTableCell(RateSettingCell.self)
            cell.setData(detail: listRateSetting[indexPath.section].ConfigPrices[indexPath.row], indexPath: indexPath)
            cell.rateDelegate = self
            cell.delegate = self
            return cell
        }
        
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

extension RateSettingListViewController: HeaderRateSettingCellDelegate, FooterRateSettingCellDelegate {
    //--Header
    func rateSettingAction(type: RateSettingAction, rateSetting: RateSettingEntity) {
        if type == .delete {
            self.showAlert(title: "Xoá", message: "Bạn có chắc chắn muốn xoá?") {
                guard let id = rateSetting.RoomClass?.Id else { return }
                self.presenter?.deleteRoomClass(listID: [id])
            }
        } else {
            let editGeneralVC = EditGeneralRateSettingRouter.createModule(rateSetting: rateSetting)
            editGeneralVC.modalPresentationStyle = .overCurrentContext
            editGeneralVC.modalTransitionStyle = .crossDissolve
            editGeneralVC.delegate = self
            self.present(controller: editGeneralVC)
        }
    }
    //--Footer
    func btnAddConfigureTapped() {
        let vc = AddGeneralConfigureRouter.createModule().convertNavi()
        self.present(controller: vc)
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

extension RateSettingListViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let edit = SwipeAction(style: .default, title: nil) { action, indexPath in
            print("Edit")
            self.editActionTapped(indexPath: indexPath)
        }
        configure(action: edit, with: .edit)
        
        let delete = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            print("Delete")
            self.deleteActionTapped(indexPath: indexPath)
        }
        configure(action: delete, with: .trash)
        
        return [delete, edit]
    }
    
    func configure(action: SwipeAction, with descriptor: ActionDescriptor) {
        action.image = descriptor.image(forStyle: buttonStyle, displayMode: buttonDisplayMode)
        
        switch buttonStyle {
        case .backgroundColor:
            action.backgroundColor = descriptor.color(forStyle: buttonStyle)
        case .circular:
            action.backgroundColor = .clear
            action.transitionDelegate = ScaleTransition.default
        }
    }
    
    private func editActionTapped(indexPath: IndexPath) {
        let vc = AddGeneralConfigureRouter.createModule().convertNavi()
        self.present(controller: vc)
    }
    
    private func deleteActionTapped(indexPath: IndexPath) {
            
        self.showAlert(title: "Xoá", message: "Bạn có chắc chắn muốn xoá?") {
            guard let id = self.listRateSetting[indexPath.section].ConfigPrices[indexPath.row].ConfigPriceRow?.Id else { return }
            self.presenter?.deleteConfigPrice(listID: [id])
        }
    }
}

extension RateSettingListViewController: RateSettingDelegate {
    func updateDataRateSettingList() {
        presenter?.getRoomClass()
    }
}
