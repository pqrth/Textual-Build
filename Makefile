##########################
VERSION=v7.0.4
CODE_SIGN_IDENTITY=chedr
##########################

all :
	git clone --recursive --branch ${VERSION} https://github.com/Codeux-Software/Textual.git Textual-${VERSION}
	cd Textual-${VERSION} && \
	sed -i -e 's/TEXTUAL_BUILT_WITH_LICENSE_MANAGER=1/TEXTUAL_BUILT_WITH_LICENSE_MANAGER=0/' Configurations/Build/Standard\ Release/Enabled\ Features.xcconfig && \
	sed -i -e 's/TEXTUAL_BUILT_WITH_HOCKEYAPP_SDK_ENABLED=1/TEXTUAL_BUILT_WITH_HOCKEYAPP_SDK_ENABLED=0/' Configurations/Build/Standard\ Release/Enabled\ Features.xcconfig && \
	sed -i -e 's/TEXTUAL_BUILT_WITH_SPARKLE_ENABLED=1/TEXTUAL_BUILT_WITH_SPARKLE_ENABLED=0/' Configurations/Build/Standard\ Release/Enabled\ Features.xcconfig && \
	sed -i -e 's/CODE_SIGN_IDENTITY = Mac Developer/CODE_SIGN_IDENTITY = ${CODE_SIGN_IDENTITY}/' Configurations/Build/Code\ Signing\ Identity.xcconfig && \
	sed -i -e 's/DEVELOPMENT_TEAM = 8482Q6EPL6/DEVELOPMENT_TEAM =/' Configurations/Build/Code\ Signing\ Identity.xcconfig && \
	sed -i -e 's/PROVISIONING_PROFILE_SPECIFIER = 8482Q6EPL6\//PROVISIONING_PROFILE_SPECIFIER =/' Configurations/Build/Code\ Signing\ Identity.xcconfig && \
	xcodebuild -scheme 'Textual (Standard Release)' build

clean :
	rm -rf Textual-${VERSION}

install :
	cd Textual-${VERSION} && \
	cp -r Build\ Results/Release/Textual.app /Applications
