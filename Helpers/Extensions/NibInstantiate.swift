//
//  NibInstantiate.swift
//  UISDK-iOS
//
//  Created by Banco Santander Brasil on 10/03/19.
//

import Foundation

public protocol NibInstantiate {
    static var nibName: String { get }
}

extension NibInstantiate {
    public static var nibName: String {
        return String(describing: self)
    }
}

public extension NibInstantiate where Self: UIViewController {
    static func initFromNib() -> Self? {
        return Self(nibName: nibName, bundle: Bundle(for: self))
    }
    
}

public extension NibInstantiate where Self: UIView {
    static func initFromNib() -> Self? {
        return UINib(nibName: nibName, bundle: Bundle(for: self)).instantiate(withOwner: self, options: nil)[0] as? Self
    }
}
