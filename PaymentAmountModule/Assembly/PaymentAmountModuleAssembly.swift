#if DEBUG_MENU

enum PaymentAmountModuleAssembly {
    static func makeModule() -> BaseModule {
        PaymentAmountDemoViewController(viewModel: .init())
    }
}

#endif
