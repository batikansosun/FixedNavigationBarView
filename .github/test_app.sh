#!/bin/bash

set -eo pipefail

xcodebuild -project FixedNavigationBarView.project \
            -scheme FixedNavigationBarView\ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/FixedNavigationBarView.xcarchive \
            clean archive | xcpretty
