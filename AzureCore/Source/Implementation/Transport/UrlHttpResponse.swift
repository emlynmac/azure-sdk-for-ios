//
//  URLHttpResponse.swift
//  AzureCore
//
//  Created by Travis Prescott on 9/5/19.
//  Copyright © 2019 Azure SDK Team. All rights reserved.
//

import Foundation

public class UrlHttpResponse: HttpResponse {
    private var internalResponse: HTTPURLResponse?

    public init(request: HttpRequest, response: HTTPURLResponse?, blockSize: Int = 4096) {
        self.internalResponse = response
        let statusCode = response?.statusCode
        super.init(request: request, statusCode: statusCode, blockSize: blockSize)
        guard let internalHeaders = response?.allHeaderFields else { return }
        for (key, value) in internalHeaders where key is String {
            // swiftlint:disable:next force_cast
            self.headers[key as! String] = value as? String
        }
    }
}
