PRJ:=ArchDemo/ArchDemo.xcodeproj
SDK:=iphonesimulator

list-info:
	xcodebuild -list -project $(PRJ) 

build:
	xcodebuild build -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -derivedDataPath output \
	  -sdk $(SDK) \
	  -configuration Release
	cp -r output/Build/Products/Release-iphonesimulator/ArchDemo.framework .
	file ArchDemo.framework/ArchDemo 

archive:
	xcodebuild archive -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -archivePath output \
	  -sdk $(SDK) \
	  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
	  SKIP_INSTALL=NO \
	  -configuration Release

clean:
	rm -rf output/*
	rm -rf output.xcarchive/*
	rm -rf ArchDemo.framework
