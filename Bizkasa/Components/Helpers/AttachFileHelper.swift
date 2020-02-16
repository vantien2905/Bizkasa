////
////  AttachFileHelper.swift
////  DXG E-Office
////
////  Created by DINH VAN TIEN on 12/31/19.
////  Copyright © 2019 DINH VAN TIEN. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class AttachFileHelper {
//    static let shared = AttachFileHelper()
//
//    func showAttachFile() {
//        guard let topVC = UIApplication.topViewController() else { return }
//        let importMenu = UIDocumentPickerViewController(documentTypes: ["public.content","public.item"], in: .import)
//        importMenu.delegate = self
//        importMenu.modalPresentationStyle = .formSheet
//        if UIDevice.isIPAD() {
//            importMenu.modalPresentationStyle = .popover
//            importMenu.popoverPresentationController?.sourceView = topVC.view
//            importMenu.popoverPresentationController?.sourceRect = topVC.view.frame
//        }
//        topVC.present(importMenu, animated: true, completion: nil)
//    }
//}
//
//extension AttachFileHelper: UIDocumentPickerDelegate {
//
//    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
//
//        do {
//            let fileId = NSUUID().uuidString.lowercased()
//            let fileName = url.lastPathComponent
//            let fileExt = url.pathExtension
//
//            let data = try Data(contentsOf: url)
//            let base64 = data.base64EncodedString(options: .lineLength64Characters)
//            if let fileSize = try url.resourceValues(forKeys: [.fileSizeKey]).fileSize {
//                var  attachFile = AttachmentFile(id: fileId, fileName: fileName, fileExt: fileExt, fileContent: base64)
//                attachFile.fileSise  = fileSize / 1000
////                attachFiles.append(attachFile)
////                self.tbListFile.reloadData()
//            }
//        } catch  {
////            self.view.makeToast("Đính kèm file thất bại !".localization())
//        }
//    }
//}
