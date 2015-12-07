cask :v1 => 'xcode' do
  version '7.1.1'
  sha256 "68e4062c52be3e04c84539c1d6f4e816fec5edaf297a848ccf6e3508c77b99b6"

  # To download Xcode.dmg, see http://stackoverflow.com/a/10335943/622662
  url 'http://10.60.1.18:8082/files/f84c5cd2-d368-4bec-9520-b85b534ea169/Xcode_7.1.1.dmg'
  name 'Xcode'
  homepage 'https://developer.apple.com'
  license :freemium

  app 'Xcode.app', target: '/Applications/Xcode.app'

  pkg 'Xcode.app/Contents/Resources/Packages/MobileDevice.pkg'
  pkg 'Xcode.app/Contents/Resources/Packages/MobileDeviceDevelopment.pkg'

  postflight do
    system 'sudo', 'xcode-select', '-s', '/Applications/Xcode.app'
    # Accept xcode license, see http://stackoverflow.com/a/33655684/622662
    system 'sudo', 'xcodebuild', '-license', 'accept'
  end
end
