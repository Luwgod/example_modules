#if DEBUG_MENU

import RxSwift
import RxCocoa
import UbrdDesignSystem

final class PaymentAmountDemoCellModel: ReactiveCompatible {

    fileprivate let amountRelay = BehaviorRelay<String>(value: "500")
    fileprivate let discountedAmountRelay = BehaviorRelay<String>(value: .empty)
    fileprivate let commentRelay = BehaviorRelay<String>(value: .empty)
    fileprivate let hintRelay = BehaviorRelay<String>(value: .empty)

    var amount: String {
        get {
            amountRelay.value
        }
        set {
            amountRelay.accept(newValue)
        }
    }

    var discountedAmount: String {
        get {
            discountedAmountRelay.value
        }
        set {
            discountedAmountRelay.accept(newValue)
        }
    }

    var comment: String {
        get {
            commentRelay.value
        }
        set {
            commentRelay.accept(newValue)
        }
    }

    var hint: String {
        get {
            hintRelay.value
        }
        set {
            hintRelay.accept(newValue)
        }
    }

    var paymentAmountModel: PaymentAmountViewModel {
        .init(amount: amount,
              discountedAmount: discountedAmount,
              comment: comment,
              hint: hint)
    }
}

extension Reactive where Base: PaymentAmountDemoCellModel {

    var amount: Observable<String> {
        base.amountRelay.asObservable()
    }

    var discountedAmount: Observable<String> {
        base.discountedAmountRelay.asObservable()
    }

    var comment: Observable<String> {
        base.commentRelay.asObservable()
    }

    var hint: Observable<String> {
        base.hintRelay.asObservable()
    }
}

#endif
