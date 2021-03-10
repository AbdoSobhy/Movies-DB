//
//  ApiRouter.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import Foundation

struct GeneralError: Codable {
    let code: Int
    let message: String
   enum CodingKeys: String, CodingKey {
      case code
      case message = "msg"
   }
}
