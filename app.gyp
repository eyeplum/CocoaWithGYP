{
  'targets': [
    {
      'target_name': 'test_app',
      'product_name': 'TestApp',
      'type': 'executable',
      'mac_bundle': 1,
      'include_dirs': [
        './app/', 
        './libs/',
      ],
      'sources': [
        './app/main.m',
        './app/App-Prefix.pch',
        './app/AppDelegate.h',
        './app/AppDelegate.m',
        './app/ViewController.h',
        './app/ViewController.m',
      ],
      'link_settings': {
        'libraries': [
          '$(SDKROOT)/System/Library/Frameworks/Cocoa.framework',
          '$(SDKROOT)/System/Library/Frameworks/QuartzCore.framework',
          './libs/POP/pop.framework',
        ],
      },
      'mac_bundle_resources': [
        './app/App-Info.plist',
        './app/MainMenu.xib',
        './libs/POP/pop.framework',
      ],
      'xcode_settings': {
        'INFOPLIST_FILE': './app/App-Info.plist',
        'CLANG_ENABLE_OBJC_ARC': 'YES',
        'FRAMEWORK_SEARCH_PATHS': '$(PROJECT_DIR)/libs/POP/',
      },
    },
  ],
}

