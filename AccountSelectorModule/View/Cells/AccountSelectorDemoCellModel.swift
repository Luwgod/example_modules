#if DEBUG_MENU

import RxSwift
import RxCocoa
import UbrdDesignSystem

final class AccountSelectorDemoCellModel: ReactiveCompatible {

    fileprivate let titleRelay = BehaviorRelay<String>(value: "Title")
    fileprivate let accountNameRelay = BehaviorRelay<String>(value: "Account name")
    fileprivate let amountRelay = BehaviorRelay<String>(value: "Amount")
    fileprivate let accountNumberRelay = BehaviorRelay<String>(value: "1234 5678 1234 5678")
    fileprivate let cardColorRelay = BehaviorRelay<AccountSelector.CardColor>(value: .account)

    var cardColor: AccountSelector.CardColor {
        get {
            cardColorRelay.value
        }
        set {
            cardColorRelay.accept(newValue)
        }
    }

    var title: String {
        get {
            titleRelay.value
        }
        set {
            titleRelay.accept(newValue)
        }
    }

    var accountName: String {
        get {
            accountNameRelay.value
        }
        set {
            accountNameRelay.accept(newValue)
        }
    }

    var amount: String {
        get {
            amountRelay.value
        }
        set {
            amountRelay.accept(newValue)
        }
    }

    var accountNumber: String {
        get {
            accountNumberRelay.value
        }
        set {
            accountNumberRelay.accept(newValue)
        }
    }

    var accountSelectorModel: AccountSelectorModel {
        .init(title: title,
              accountName: accountName,
              amount: amount,
              accountNumber: accountNumber,
              cardColor: cardColor)
    }
}

extension Reactive where Base: AccountSelectorDemoCellModel {

    var cardColor: Observable<AccountSelector.CardColor> {
        base.cardColorRelay.asObservable()
    }

    var title: Observable<String> {
        base.titleRelay.asObservable()
    }

    var accountName: Observable<String> {
        base.accountNameRelay.asObservable()
    }

    var amount: Observable<String> {
        base.amountRelay.asObservable()
    }

    var accountNumber: Observable<String> {
        base.accountNumberRelay.asObservable()
    }
}

#endif
