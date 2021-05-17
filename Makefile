PRJ:=ArchDemo/ArchDemo.xcodeproj
SDK:=iphonesimulator
CONFIGURATION:=Release

help:
	echo '[build|archive] [SDK=[iphonesimulator|iphone]] [CONFIGURATION=[Release|Debug]]'

list-info:
	xcodebuild -list -project $(PRJ) 

build:
	xcodebuild build -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -derivedDataPath output \
	  -sdk $(SDK) \
	  -configuration $(CONFIGURATION)
	cp -r output/Build/Products/$(CONFIGURATION)-iphonesimulator/ArchDemo.framework .
	file ArchDemo.framework/ArchDemo 

archive:
	xcodebuild archive -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -archivePath output \
	  -sdk $(SDK) \
	  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	  SKIP_INSTALL=NO \
	  -configuration $(CONFIGURATION)
	cp -r output.xcarchive/Products/Library/Frameworks/ArchDemo.framework .
	file ArchDemo.framework/ArchDemo

clean:
	rm -rf output/*
	rm -rf output.xcarchive/*
	rm -rf ArchDemo.framework
