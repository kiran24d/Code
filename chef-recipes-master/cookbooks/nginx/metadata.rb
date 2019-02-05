name 'nginx'
maintainer 'tomegathericon'
maintainer_email 'akapoor@emersonecologics.com'
license 'All Rights Reserved'
description 'Nginx'
long_description 'Nginx MGMT'
version '1.2.6'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends "yum"
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/Ares_UI/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/Ares_UI'
