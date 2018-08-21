#
#  Be sure to run `pod spec lint PPMaker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "PPMaker"
  s.version      = "0.0.251"
  s.summary      = "终极版、链式创建UIView/UIlabel/UIImageView/UIButton/UItableView等，像使用Masonry一样 to use !"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                    总算有个终极版的UI创建方案了，很欣慰。最开始的时候，一步一步创建各种UI控件，然后一个一个属性点语法出来，代码重复且繁重，
                    后来用对应category来处理，但是有些时候，某些参数并不是我想要的，但是方法中已经有了，直到昨天看到臧成威的文章，我自己写了
                    这么几个类，以后就爽很多了。
                   DESC

  s.homepage     = "https://github.com/chinesemanbobo/PPMaker"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license = { :type => 'MIT', :text => <<-LICENSE
         Copyright PPAbner 2018
          LICENSE
      }

  s.author             = { "chinesemanbobo" => "chinesemanbobo@163.com" }

  s.social_media_url   = "https://weibo.com/5366568018/profile?rightmod=1&wvr=6&mod=personnumber&is_all=1"

  s.platform     = :ios
  
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/chinesemanbobo/PPMaker.git", :tag => s.version }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = 'PPMaker/PPMaker.h'

  s.subspec 'PPMakeCategory' do |ss|
  	# ss.source_files = 'PPMaker/PPMakeCategory/*.{h,m}'
  	ss.subspec 'Foundation' do |ssFoundation|
  		ssFoundation.subspec 'NSString' do |ssStr|
  			ssStr.source_files = 'PPMaker/PPMakeCategory/Foundation/NSString/*.{h,m}'
  		end

  		ssFoundation.subspec 'NSMutableAttributedString' do |ssMutStr|
  		    ssMutStr.source_files = 'PPMaker/PPMakeCategory/Foundation/NSMutableAttributedString/*.{h,m}'
  		end 

  		ssFoundation.subspec 'NSObject' do |ssObj|
  		    ssObj.source_files = 'PPMaker/PPMakeCategory/Foundation/NSObject/*.{h,m}'
  		end 
  	end

  	ss.subspec 'UIKit' do |ssUIKit|
  		ssUIKit.subspec 'UITableViewCell' do |ssCell|
  			ssCell.source_files = 'PPMaker/PPMakeCategory/UIKit/UITableViewCell/*.{h,m}'
  		end

  		ssUIKit.subspec 'UIScrollView' do |ssScrollView|
  			ssScrollView.source_files = 'PPMaker/PPMakeCategory/UIKit/UIScrollView/*.{h,m}'
  		end

  		ssUIKit.subspec 'UIImage' do |ssImage|
  			ssImage.source_files = 'PPMaker/PPMakeCategory/UIKit/UIImage/*.{h,m}'
  		end

  		ssUIKit.subspec 'UIColor' do |ssColor|
  			ssColor.source_files = 'PPMaker/PPMakeCategory/UIKit/UIColor/*.{h,m}'
  		end

  		ssUIKit.subspec 'UIDevice' do |ssDevice|
  			ssDevice.source_files = 'PPMaker/PPMakeCategory/UIKit/UIDevice/*.{h,m}'
  		end

  		ssUIKit.subspec 'UIFont' do |ssFont|
  			ssFont.source_files = 'PPMaker/PPMakeCategory/UIKit/UIFont/*.{h,m}'
  		end

  		# ssUIKit.subspec 'UIButton' do |ssButton|
  		# 	ssButton.source_files = 'PPMaker/PPMakeCategory/UIKit/UIButton/*.{h,m}'
  		# end

  		ssUIKit.subspec 'UIView' do |ssView|
  			ssView.source_files = 'PPMaker/PPMakeCategory/UIKit/UIView/*.{h,m}'
  			ssView.dependency 'PPMaker/PPMakeCategory/Foundation/NSObject'
  		end
  	end
  end

  s.subspec 'PPMake' do |ss|
    ss.source_files = 'PPMaker/PPMake/*.{h,m}'
    ss.dependency 'PPMaker/PPMakeCategory'
    end

  s.subspec 'PPMutAttributedStringMaker' do |ss|
    ss.source_files = 'PPMaker/PPMutAttributedStringMaker/PPMutAttributedStringMaker.{h,m}'
    end

  s.subspec 'PPToolMaker' do |ss|
    ss.source_files = 'PPMaker/PPToolMaker/PPTool.{h,m}'
    end




  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  s.public_header_files = 'PPMaker/PPMaker.h' 

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
