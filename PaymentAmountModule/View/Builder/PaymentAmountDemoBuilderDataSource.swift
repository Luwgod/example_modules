#if DEBUG_MENU

protocol PaymentAmountDemoBuilderDataSource {
    var itemModels: [TitledTextFieldCellModel] { get }
    var paymentAmountModel: PaymentAmountDemoCellModel { get }
}

#endif
