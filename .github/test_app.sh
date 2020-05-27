#!/bin/bash

set -eo pipefail

xcodebuild -project FixedNavigationBarView.xcodeproj \
            -scheme FixedNavigationBarView\
            -sdk iphonesimulator \
            -configuration Debug \
