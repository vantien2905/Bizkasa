//
//  HomeViewController.swift
//  CodeBase
//
//  Created DINH VAN TIEN on 2/12/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

let listTitle = ["Trang chủ",
                 "Lễ tân",
                 "Phiếu thu",
                 "Phiếu chi",
                 "Quản lý tầng/ lầu",
                 "Dịch vụ",
                 "Cài đặt giá phòng",
                 "Báo cáo thống kê",
                 "Giao ca",
                 "Cấu hình hệ thống",
                 "Thông tin khách sạn"]
let listImageTitle = [AppImage.receptionist,
                     AppImage.receipts,
                     AppImage.payment,
                     AppImage.manage,
                     AppImage.service,
                     AppImage.setting,
                     AppImage.statistic,
                     AppImage.shift,
                     AppImage.settingSystem,
                     AppImage.info]


class HomeViewController: HomeBaseViewController {

    @IBOutlet weak var cvHome       : UICollectionView!
    @IBOutlet weak var lbService    : UILabel!
    @IBOutlet weak var lbRoom       : UILabel!
    @IBOutlet weak var lbTotal      : UILabel!

    var presenter: HomePresenterProtocol?
    
    enum SectionType: Int, CaseIterable {
        case notification
        case management
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        if let user = UserDefaultHelper.shared.getUser(), let shiftID = user.ShiftId {
            presenter?.reportRevenue(shiftID: shiftID)
        }
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Trang chủ")
    }

    private func configureCollectionView() {
        cvHome.registerCollectionCell(HomeCVCell.self)
        cvHome.registerCollectionCell(NotificationCollectionViewCell.self)
        cvHome.register(header: HeaderCollectionReusableView.self)
        cvHome.delegate = self
        cvHome.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        cvHome.collectionViewLayout = layout
    }

}

extension HomeViewController: HomeViewProtocol {
    func didReportRevenue(result: RevenueEntity?, error: APIError?) {
        if let result = result, let today = result.Today {
            lbService.text = "\(today.ServiceAmount*.formattedWithSeparator)"
            lbRoom.text = "\(today.RoomAmount*.formattedWithSeparator)"
            lbTotal.text = "\(today.Cashed*.formattedWithSeparator)"
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

    func didGetReceiptReport(result: [ReceipReportEntity]?, error: APIError?) {
        if let result = result, result.count > 7 {
            lbService.text = "\(result[6].Amount*.formattedWithSeparator)"
            lbTotal.text = "\(result[6].Amount*.formattedWithSeparator)"
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch SectionType(rawValue: section) {
        case .notification:
            return 1
        default:
            return listTitle.count - 1
        }
       
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionType(rawValue: indexPath.section) {
        case .notification:
            let cell = collectionView.dequeueCollectionCell(NotificationCollectionViewCell.self, indexPath: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueCollectionCell(HomeCVCell.self, indexPath: indexPath)
            cell.lbTitle.text = listTitle[indexPath.row + 1]
            cell.imgLogo.image = listImageTitle[indexPath.row]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch SectionType(rawValue: indexPath.section) {
        case .notification:
            break
        default:
            setContentVC(index: indexPath.row + 1)
        }
       

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch SectionType(rawValue: indexPath.section) {
        case .notification:
            return CGSize(width: collectionView.frame.width - 20, height: 100)
        default:
            return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeue(header: HeaderCollectionReusableView.self, indexPath: indexPath)
            switch SectionType(rawValue: indexPath.section) {
            case .notification:
                header.titleLabel.text = "Thông báo"
            default:
                header.titleLabel.text = "Quản lý"
            }
            return header
        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
}
