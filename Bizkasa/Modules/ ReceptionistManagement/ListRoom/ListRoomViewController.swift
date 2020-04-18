//
//  ListRoomViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListRoomViewController: HomeBaseViewController {

    @IBOutlet weak var cvListRoom: UICollectionView!

	var presenter: ListRoomPresenterProtocol?

    var listRoomType: [RoomTypeEntity] = [] {
        didSet {
            cvListRoom.reloadData()
        }
    }

    let heightHeader: CGFloat = 60

	override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        presenter?.getRoomsByClass()

        NotificationCenter.default.addObserver(forName: .refreshReceptionist, object: nil, queue: nil) { (_) in
            self.presenter?.getRoomsByClass()
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Danh sách phòng")
    }

    private func configureCollectionView() {
        cvListRoom.registerCollectionCell(ListRoomCVCell.self)
        cvListRoom.register(header: HeaderRoomView.self)
        cvListRoom.delegate = self
        cvListRoom.dataSource = self
        let screen = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screen.width/2, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        cvListRoom.collectionViewLayout = layout
    }

}

extension ListRoomViewController: ListRoomViewProtocol {
    func didGetRoomsByClass(result: [RoomTypeEntity]?, error: APIError?) {
        if let result = result {
            self.listRoomType = result
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

	
}

extension ListRoomViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.listRoomType.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listRoomType[section].Rooms.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCollectionCell(ListRoomCVCell.self, indexPath: indexPath)
        cell.delegate = self
        cell.room = self.listRoomType[indexPath.section].Rooms[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeue(header: HeaderRoomView.self, indexPath: indexPath)
            header.lbTitle.text = listRoomType[indexPath.section].Name&.uppercased()
            return header
        default:  fatalError("Unexpected element kind")
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: heightHeader)
    }
}

extension ListRoomViewController: ListRoomCVCellDelegate {
    func actionTapped(type: String, room: RoomEntity?) {
        guard let room = room else { return }
        switch type {
        case ActionRoom.checkIn.rawValue:
            let vc = CheckInRouter.createModule(room: room).convertNavi()
            self.present(controller: vc)
        case ActionRoom.checkOut.rawValue:
            let vc = CheckOutRouter.createModule(room: room)
            vc.delegate = self
            self.present(controller: vc.convertNavi())
        default:
            break
        }
    }
}

extension ListRoomViewController: CheckOutViewControllerDelegate {
    func checkOutSuccess() {
        presenter?.getRoomsByClass()
    }
}