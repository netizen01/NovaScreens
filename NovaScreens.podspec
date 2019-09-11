Pod::Spec.new do |spec|

    spec.name                   = 'NovaScreens'
    spec.version                = '0.8'
    spec.summary                = 'Delegate pattern for Screen Connection Notifications'

    spec.homepage               = 'https://github.com/netizen01/NovaScreens'
    spec.license                = { :type => 'MIT', :file => 'LICENSE' }
    spec.author                 = { 'Netizen01' => 'n01@invco.de' }

    spec.ios.deployment_target  = '9.3'

    spec.source                 = { :git => 'https://github.com/netizen01/NovaScreens.git',
                                    :tag => spec.version.to_s }
    spec.source_files           = 'Sources/**/*.swift'
    spec.swift_versions         = ['5.0']

end
