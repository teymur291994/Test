//
//  String+Extensions.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

import Foundation
import CommonCrypto

extension String {

    var md5: String {
        if let strData = data(using: String.Encoding.utf8) {
            var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))

            _ = strData.withUnsafeBytes {

                CC_MD5($0.baseAddress, UInt32(strData.count), &digest)
            }
            var md5String = ""
            for byte in digest {
                md5String += String(format: "%02x", UInt8(byte))
            }
            return md5String
        }
        return ""
    }
}
