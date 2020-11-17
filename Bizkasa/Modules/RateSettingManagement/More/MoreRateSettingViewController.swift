//
//  MoreRateSettingViewController.swift
//  Bizkasa
//
//  Created Tien Dinh on 10/24/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

enum Surchanrge: Int, CaseIterable {
    case priceByHour
    case checkoutDayList
    case checkoutNightList
    case checkinDayList
    case checkinNightList
    case addtionCustomerList
}

class MoreRateSettingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!

	var presenter: MoreRateSettingPresenterProtocol?
    
    var configurePrice: ConfigPriceEntity?

	override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func setUpNavigation() {
        addBackWhiteToNavigation()
        setTitleNavigation(title: "Phụ thu")
    }
    
    private func configureTableView() {
        tableView.registerTableCell(MoreRateSettingCell.self)
        tableView.registerTableCell(HourRateSettingCell.self)
        tableView.register(header: HeaderMoreRateSettingCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.tableFooterView = UIView()
    }
}

extension MoreRateSettingViewController: MoreRateSettingViewProtocol {
	
}

extension MoreRateSettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Surchanrge.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let configure = configurePrice else { return 0}
        switch section {
        case Surchanrge.priceByHour.rawValue:
            return configure.PriceByDayList.count
        case Surchanrge.checkoutDayList.rawValue:
            return configure.CheckoutDayList.count
        case Surchanrge.checkoutNightList.rawValue:
            return configure.CheckoutNightList.count
        case Surchanrge.checkinDayList.rawValue:
            return configure.CheckinDayList.count
        case Surchanrge.checkinNightList.rawValue:
            return configure.CheckinNightList.count
        case Surchanrge.addtionCustomerList.rawValue:
            return configure.AddtionCustomerList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Surchanrge.priceByHour.rawValue {
            let cell = tableView.dequeueTableCell(HourRateSettingCell.self)
            cell.setData(detail: configurePrice?.PriceByDayList[indexPath.row], row: indexPath.row)
            return cell
        } else {
            let cell = tableView.dequeueTableCell(MoreRateSettingCell.self)
            cell.setData(configure: configurePrice, indexPath: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeue(header: HeaderMoreRateSettingCell.self)
        header.setShadawHeader()
        header.setData(section: section)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == Surchanrge.priceByHour.rawValue {
            let footer = UIView()
            let label = UILabel()
            footer.addSubview(label)
            label.anchor(footer.topAnchor,
                         left: footer.leftAnchor,
                         bottom: footer.bottomAnchor,
                         right: footer.rightAnchor,
                         topConstant: 0,
                         leftConstant: 10,
                         bottomConstant: 0,
                         rightConstant: 0)
            label.text = "Vượt quá thời gian trên tính 1 ngày"
            label.textColor = .red
            return footer
        } else { return nil }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == Surchanrge.priceByHour.rawValue ? 40 : 0
    }
}

extension MoreRateSettingViewController: UITableViewDelegate {
    
}
