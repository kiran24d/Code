name 'dotnet2.0'
maintainer 'yogeshdass'
maintainer_email 'yogeshdass@yandex.ru'
license 'All Rights Reserved'
description 'Installs/Configures dotnet2.0'
long_description 'Installs/Configures dotnet2.0'
version '1.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/dotnet2.0/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/dotnet2.0'

depends 'mono-msbuild'