name 'nexus-provisoner'
maintainer 'yogeshdass'
maintainer_email 'yogeshdass@yandex.ru'
license 'All Rights Reserved'
description 'Installs/Configures nexus-provisoner'
long_description 'Installs/Configures nexus-provisoner'
version '1.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/nexus-provisoner/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/nexus-provisoner'
depends 'java'
depends 'nexus3'
