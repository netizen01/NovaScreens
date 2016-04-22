Pod::Spec.new do |spec|
    spec.name           = 'NovaScreens'
    spec.version        = '0.0.1'
    spec.license        = { :type => 'MIT' }
    spec.homepage       = 'https://github.com/netizen01/NovaScreens'
    spec.authors        = { 'Netizen01' => 'n01@invco.de' }
    spec.summary        = 'Delegate pattern for Screen Connection Notifications'
    spec.source         = { :git => 'https://github.com/netizen01/NovaScreens.git',
                            :tag => spec.version.to_s }
    spec.source_files   = 'Source/**/*.swift'

    spec.ios.deployment_target  = '8.4'
end
