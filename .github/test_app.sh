#!/bin/bash

set -eo pipefail

xcodebuild -project FixedNavigationBarView.xcodeproj \
            -scheme FixedNavigationBarView\
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/FixedNavigationBarView.xcarchive \
            clean archive | xcpretty
