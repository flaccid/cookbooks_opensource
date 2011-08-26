# use nightly builds
set_unless[:mongodb][:release] = 'default'

set_unless[:mongodb][:dbpath] = '/mnt/storage'