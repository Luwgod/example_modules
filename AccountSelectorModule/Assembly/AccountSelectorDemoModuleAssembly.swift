#if DEBUG_MENU

enum AccountSelectorDemoModuleAssembly {
    static func makeModule() -> AccountSelectorModule {
        AccountSelectorDemoViewController(viewModel: .init())
    }
}

#endif
