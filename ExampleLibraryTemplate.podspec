require 'json'

# MARCH TEAM SPACE
## DO NOT REMOVE THESE LINES
libraryVersion = "1.0.1"
libraryName = "ExampleLibraryTemplate"
gitHomepage = "https://github.com/ca-aguilar/ExampleLibraryTemplate"
gitRemote = "git@github.com:ca-aguilar/ExampleLibraryTemplate.git"
## END DO NOT REMOVE THESE LINES
# END MARCH TEAM SPACE

Pod::Spec.new do |s|
    s.name             = libraryName
    s.version          = libraryVersion
    s.summary          = 'A template library that supports SPM and Cocoapods'
    
    s.homepage         = gitHomepage
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'Ezequiel (Kimi) Aceto' => 'ezequiel.aceto@gruposantander.es', 'Ivan (NSCabezon) Cabezón Orjales' => 'ivan.cabezonorjales@gruposantander.es' }
    
    s.source           = {
        :git => gitRemote,
        :tag => s.version.to_s
    }
    
    s.ios.deployment_target = '10.0'
    s.swift_version    = '5.3'
    
    s.cocoapods_version = '>= 1.4.0'
    
    s.frameworks       = "Foundation"
    #s.dependency       = 'SSKeychain', '~> 1.2.3'
    s.source_files     = "Sources/#{libraryName}/**/*"
    s.resource_bundles = {
        "#{libraryName}_#{libraryName}" => [
            "Sources/#{libraryName}/Resources/**/*"
        ]
    }
end