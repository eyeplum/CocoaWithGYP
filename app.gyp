{
  'targets': [
    {
      'target_name': 'test_app',
      'product_name': 'TestApp',
      'type': 'executable',
      'mac_bundle': 1,
      'include_dirs': [
        './app/', 
      ],
      'sources': [
        './app/main.m',
        './app/App-Prefix.pch',
        './app/AppDelegate.h',
        './app/AppDelegate.m',
      ],
      'link_settings': {
        'libraries': [
          '$(SDKROOT)/System/Library/Frameworks/Cocoa.framework',
        ],
      },
      'mac_bundle_resources': [
        './app/App-Info.plist',
        './app/MainMenu.xib',
      ],
      'xcode_settings': {
        'INFOPLIST_FILE': './app/App-Info.plist',
        'CLANG_ENABLE_OBJC_ARC': 'YES',
      },
    },
  ],
}
