platform :ios, '11.4'

install! 'cocoapods'

target 'Pokedex-MVP' do
  use_frameworks!
  
  pod 'Alamofire', '~> 5.2'
  pod 'RxSwift', '6.0.0'
  pod 'RxCocoa', '6.0.0'
  pod 'Nuke', '~> 9.0'
  
  target 'Pokedex-MVPTests' do
    inherit! :search_paths
    
    pod 'Nimble'
    pod 'RxBlocking', '6.0.0'
    pod 'RxTest', '6.0.0'
  end

end
