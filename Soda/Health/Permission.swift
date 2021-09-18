//
//  Permission.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/17.
//

import HealthKit

protocol Permission {
    func request(success: @escaping () -> Void, failure: @escaping () -> Void)
}

struct HealthPermission: Permission {
    func request(success: @escaping () -> Void, failure: @escaping () -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            failure()
            return
        }
        
        guard let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass) else {
            failure()
            return
        }
        
        HKHealthStore().requestAuthorization(toShare: nil, read: [bodyMass]) { isSuccess, error in
            if isSuccess {
                success()
            } else {
                failure()
            }
        }
    }
}
