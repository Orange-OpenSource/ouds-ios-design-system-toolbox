#
# Software Name: OUDS iOS
# SPDX-FileCopyrightText: Copyright (c) Orange SA
# SPDX-License-Identifier: MIT
#
# This software is distributed under the MIT license,
# the text of which is available at https://opensource.org/license/MIT/
# or see the "LICENSE" file for more details.
#
# Authors: See CONTRIBUTORS.txt
# Software description: A SwiftUI components library with code examples for Orange Unified Design System
#

source "https://rubygems.org"

# Troubleshooting
# ---------------

# Embeded in net-http RubyGem without defined version
# Solves CVE-2025-27221 (https://github.com/Orange-OpenSource/ouds-ios/security/dependabot/6)
# Should be removed when net-http > 0.6.0 and CVE fixed
gem 'uri', '1.0.3'

# To fix
# "warning: abbrev was loaded from the standard library, but is not part of the default gems starting from Ruby 3.4.0.
# You can add abbrev to your Gemfile or gemspec to silence this warning.""
gem 'abbrev', '0.1.2'

# Really needed gems
# ------------------

gem 'fastlane', '2.228.0'
gem 'fastlane-plugin-changelog', '0.16.0'
gem 'fastlane-plugin-mattermost', '1.3.2'
gem 'cocoapods', '1.16.2'
gem 'json', '2.12.2'
gem 'net-http', '0.6.0'
gem 'xcode-install', '2.8.1'

# Magic

plugins_path = File.join(File.dirname(__FILE__), 'DesignToolbox/fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
