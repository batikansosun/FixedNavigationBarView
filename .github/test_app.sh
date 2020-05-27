#!/bin/bash

set -eo pipefail

xcodebuild -project FixedNavigationBarView.xcodeproj \
            -scheme FixedNavigationBarView\
            -sdk iphoneos \
            -configuration Debug \
