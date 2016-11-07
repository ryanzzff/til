# CocoaPods Private Spec Repo

## Introduction

```
platform :ios, '8.0'

target 'MyApp' do
  pod 'AFNetworking', '~> 2.6'
end
```

The above example Podfile will install AFNetworking from a Public Spec Repo provided by CocoaPods.
If we need to use a private library via CocoaPods, we need a Private Spec Repo.

## What We Need

1. Private Spec Repo - a git repository that store a list of private repo
2. Library Repo - a git/svn repository that store the source code of the library

## How we create/update a private pod

### Steps

#### 1. Modify source code of the library
#### 2. Commit and push to remote Git repo
#### 3. Add a git tag for a version
#### 4. Update the version number (same as git tag) of the Podspec
#### 5. Validate the Podspec before push

LibraryA - a library may contains dependency of public pods only
LibraryB - a library that contains a static library need `use-libraries` flag
LibraryC - a library which contains dependency of other private pods

```
pod spec lint LibraryA.podspec --allow-warnings --verbose
pod spec lint LibraryB.podspec --use-libraries --allow-warnings --verbose
pod spec lint LibraryC.podspec --use-libraries --allow-warnings --verbose --sources='http://{private-git-repo-url}/cocoapods-private-spec-repo.git,https://github.com/CocoaPods/Specs.git'
```

#### 6. Push the updated Podspec to the private spec repo

You need to add the repo if you're not done before

```
pod repo add my-spec-repo http://{private-git-repo-url}/cocoapods-private-spec-repo.git
```

Push the podspec to the private spec repo for any version update:

```
pod repo push my-spec-repo LibraryA.podspec --allow-warnings
pod repo push my-spec-repo LibraryB.podspec --use-libraries --allow-warnings
pod repo push my-spec-repo LibraryC.podspec --use-libraries --allow-warnings
```

#### 7. Done, now can use the pod with the new version in Podfile

Add the private spec repo url at the very first line of the Podfile, the default public spec repo of CocoaPods also need to be added

```
source 'http://{private-git-repo-url}/cocoapods-private-spec-repo.git'
source 'https://github.com/CocoaPods/Specs.git'
```

### Local Pod Development

Pods' source code will be pull from remote (git/svn) for normal declaration

```
pod 'LibraryA', '~> 1.0.0'
```

if a path is specified, CocoaPods will get the source code from local path instead of remote (git/svn repo)

```
pod 'LibraryA', :path => 'path/to/library-a'
```

For well organized the stable pods and development pods, may declared both in separate functions

```
def stable_pods
  pod 'LibraryA', '~> 1.0.0'
end

def dev_pods
  pod 'LibraryA', :path => 'path/to/library-a'
end
```

To choose from different pods, just `execute` it out side the `def` block:

```
def stable_pods
  pod 'LibraryA', '~> 1.0.0'
end

def dev_pods
  pod 'LibraryA', :path => 'path/to/library-a'
end

# `execute` the function
dev_pods
```

# Example Podspec

```
Pod::Spec.new do |s|

  s.name         = "LibraryA"
  s.version      = "1.1.0"
  s.summary      = "A common library A"
  s.homepage     = "http://www.my-homepage.com"
  s.license      = { :type => "No License", :file => "LICENSE" }
  s.author             = { "Ryan" => "ryan@mysite.com" }
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "http://www.mysource.com/library-a", :tag => s.version }

  s.requires_arc = true

  s.subspec 'Common' do |ss|
    ss.source_files = "Common/*.h"
  end

  s.subspec 'ModuleA' do |ss|
    ss.source_files  = "ModuleA/**/*.{h,m}"
    ss.dependency 'LibraryA/Common'
    ss.dependency 'LibraryA/ModuleB'
  end

  s.subspec 'ModuleB' do |ss|
    ss.source_files  = "ModuleB/**/*.{h,m}"
    ss.dependency 'LibraryA/Common'
    ss.dependency 'SSZipArchive', '0.3.2'
  end
end

```

# Example Podfile

```
source 'http://{private-git-repo-url}/cocoapods-private-spec-repo.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'

target "my-target" do
  pod 'ReactiveObjC', '~> 1.0.1'
  pod 'Fabric', '~> 1.6.9'
  pod 'Crashlytics', '~> 3.8.2'

  def stable_pods
    pod 'LibraryA', '~> 1.0.1'
  end

  def dev_pods
    pod 'LibraryA', :path => 'path/to/library-a'
  end

  dev_pods
end

```

# References

- [Managing Private Pods With CocoaPods](https://code.tutsplus.com/tutorials/managing-private-pods-with-cocoapods--cms-25137)
