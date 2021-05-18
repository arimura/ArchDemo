PRJ:=ArchDemo/ArchDemo.xcodeproj
SDK:=iphonesimulator
CONFIGURATION:=Release
OUT:=output

help:
	echo '[build|archive] [SDK=[iphonesimulator|iphoneos]] [CONFIGURATION=[Release|Debug]]'

list-info:
	xcodebuild -list -project $(PRJ) 

build:
	xcodebuild build -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -derivedDataPath $(OUT)/build \
	  -sdk $(SDK) \
	  -configuration $(CONFIGURATION)
	cp -r $(OUT)/build/Build/Products/$(CONFIGURATION)-iphonesimulator/ArchDemo.framework .
	file ArchDemo.framework/ArchDemo 

archive:
	xcodebuild archive -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -archivePath $(OUT)/archive \
	  -sdk $(SDK) \
	  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	  SKIP_INSTALL=NO \
	  -configuration $(CONFIGURATION)
	cp -r $(OUT)/archive.xcarchive/Products/Library/Frameworks/ArchDemo.framework .
	file ArchDemo.framework/ArchDemo

xcframework:
	xcodebuild archive -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -archivePath $(OUT)/archive/iphoneos\
	  -sdk iphoneos \
	  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	  SKIP_INSTALL=NO \
	  -configuration $(CONFIGURATION)
	xcodebuild archive -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -archivePath $(OUT)/archive/iphonesimulator\
	  -sdk iphonesimulator \
	  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	  SKIP_INSTALL=NO \
	  -configuration $(CONFIGURATION)
	xcodebuild -create-xcframework \
	  -framework $(OUT)/archive/iphoneos.xcarchive/Products/Library/Frameworks/ArchDemo.framework \
	  -framework $(OUT)/archive/iphonesimulator.xcarchive/Products/Library/Frameworks/ArchDemo.framework \
	  -output $(OUT)/ArchDemo.xcframework

clean:
	rm -rf output/*
	rm -rf ArchDemo.framework
