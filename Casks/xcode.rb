cask :v1 => 'xcode' do
  version '7.1'
  sha256 "eaceba597bf6a4acdfd04ea996777fd374c4adbbb79c9728692b132a9d471324"

  # To download Xcode.dmg, see http://stackoverflow.com/a/10335943/622662
  url 'http://10.60.1.18:8082/files/ecab1336-1142-4732-84e3-a0c81b72f788/Xcode_7.1.dmg'
  name 'Xcode'
  homepage 'https://developer.apple.com'
  license :freemium

  app 'Xcode.app', target: '/Applications/Xcode.app'

  postflight do
    system 'sudo', 'xcode-select', '-s', '/Applications/Xcode.app'
    # Accept xcode license, see http://stackoverflow.com/a/33655684/622662
    system 'sudo', 'xcodebuild', '-license', 'accept'
  end
end
