PRJ:=ArchDemo/ArchDemo.xcodeproj

list-info:
	xcodebuild -list -project $(PRJ) 

release:
	xcodebuild build -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -derivedDataPath output \
	  -sdk iphonesimulator \
	  -configuration Release

clean:
	rm -rf output/*
