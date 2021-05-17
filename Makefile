PRJ:=ArchDemo/ArchDemo.xcodeproj

list-info:
	xcodebuild -list -project $(PRJ) 

ArchDemo.framework:
	xcodebuild build -project ArchDemo/ArchDemo.xcodeproj \
	  -scheme ArchDemo \
	  -derivedDataPath output \
	  -sdk iphonesimulator \
	  -configuration Release
	cp -r output/Build/Products/Release-iphonesimulator/ArchDemo.framework .
	file ArchDemo.framework/ArchDemo 

clean:
	rm -rf output/*
	rm -rf ArchDemo.framework
