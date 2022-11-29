#if DEBUG_MENU

import Utils
import RxSwift
import RxCocoa

final class AccountSelectorDemoViewModel: RxViewModel, AccountSelectorDemoBuilderDataSource, ReactiveCompatible {

    private let titleModel = TitledTextFieldCellModel(title: AccountSelectorDemoItem.title.rawValue,
                                                      placeholder: "Cell Title")
    private let accountNameModel = TitledTextFieldCellModel(title: AccountSelectorDemoItem.accountName.rawValue,
                                                            placeholder: "Payment account name")
    private let amountModel = TitledTextFieldCellModel(title: AccountSelectorDemoItem.amount.rawValue,
                                                       placeholder: "Available amount")
    private let accountNumberModel = TitledTextFieldCellModel(title: AccountSelectorDemoItem.accountNumber.rawValue,
                                                              placeholder: "Payment account number")

    private let cardColorRelay = BehaviorRelay<AccountSelectorAccountColor>(value: .account)
    fileprivate let updateRelay = PublishRelay<Void>()

    let accountSelectorModel = AccountSelectorDemoCellModel()
    let cardColorListPickerItems = [ ListPickerItemGroup(items: AccountSelectorAccountColor.allCases) ]

    var cardColorModel: TitleValueCellModel {
        .init(title: "Account color",
              value: cardColorRelay.value.rawValue,
              hasDetails: true)
    }

    var cardColor: AccountSelectorAccountColor {
        get {
            cardColorRelay.value
        }
        set {
            cardColorRelay.accept(newValue)
        }
    }

    lazy var itemModels: [TitledTextFieldCellModel] = [
        titleModel,
        accountNameModel,
        amountModel,
        accountNumberModel
    ]

    override func bind() {
        super.bind()

        titleModel.rx.onTextChanged
            .subscribe(accountSelectorModel.rx.title)
            .disposed(by: disposeBag)

        accountNameModel.rx.onTextChanged
            .subscribe(accountSelectorModel.rx.accountName)
            .disposed(by: disposeBag)

        amountModel.rx.onTextChanged
            .subscribe(accountSelectorModel.rx.amount)
            .disposed(by: disposeBag)

        accountNumberModel.rx.onTextChanged
            .subscribe(accountSelectorModel.rx.accountNumber)
            .disposed(by: disposeBag)

        cardColorRelay
            .map { $0.asAccountColor() }
            .subscribe(accountSelectorModel.rx.cardColor)
            .disposed(by: disposeBag)

        Observable.merge(titleModel.rx.onTextChanged.asVoid(),
                         accountNameModel.rx.onTextChanged.asVoid(),
                         amountModel.rx.onTextChanged.asVoid(),
                         accountNumberModel.rx.onTextChanged.asVoid(),
                         cardColorRelay.asVoid())
            .bind(to: updateRelay)
            .disposed(by: disposeBag)
    }
}

extension Reactive where Base: AccountSelectorDemoViewModel {

    var updateSignal: Signal<Void> {
        base.updateRelay.asSignal()
    }
}

#endif
