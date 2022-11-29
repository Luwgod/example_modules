#if DEBUG_MENU

import Utils
import RxSwift
import RxCocoa

final class PaymentAmountDemoViewModel: RxViewModel, PaymentAmountDemoBuilderDataSource {

    private let amountModel = TitledTextFieldCellModel(title: PaymentAmountDemoItem.amount.rawValue,
                                                       placeholder: "Payment amount")
    private let discountedAmountModel = TitledTextFieldCellModel(title: PaymentAmountDemoItem.discountedAmount.rawValue,
                                                                 placeholder: "Amount with discount")
    private let commentModel = TitledTextFieldCellModel(title: PaymentAmountDemoItem.comment.rawValue,
                                                        placeholder: "Cell comment")
    private let hintModel = TitledTextFieldCellModel(title: PaymentAmountDemoItem.hint.rawValue,
                                                     placeholder: "Cell hint")

    let paymentAmountItemsRelay = PublishRelay<Void>()

    var paymentAmountModel = PaymentAmountDemoCellModel()

    lazy var itemModels: [TitledTextFieldCellModel] = [
        amountModel,
        discountedAmountModel,
        commentModel,
        hintModel
    ]

    override func bind() {
        super.bind()

        amountModel.rx.onTextChanged
            .subscribe(paymentAmountModel.rx.amount)
            .disposed(by: disposeBag)

        discountedAmountModel.rx.onTextChanged
            .subscribe(paymentAmountModel.rx.discountedAmount)
            .disposed(by: disposeBag)

        commentModel.rx.onTextChanged
            .subscribe(paymentAmountModel.rx.comment)
            .disposed(by: disposeBag)

        hintModel.rx.onTextChanged
            .subscribe(paymentAmountModel.rx.hint)
            .disposed(by: disposeBag)

        Observable.merge(amountModel.rx.onTextChanged.asVoid(),
                         discountedAmountModel.rx.onTextChanged.asVoid(),
                         commentModel.rx.onTextChanged.asVoid(),
                         hintModel.rx.onTextChanged.asVoid())
            .bind(to: paymentAmountItemsRelay)
            .disposed(by: disposeBag)
    }
}

#endif
