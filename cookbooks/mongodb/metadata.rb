maintainer       "RightScale opensource"
maintainer_email "opensource@rightscale.com"
license          IO.read(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE'))
description      "Installs/Configures mongodb"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "mongodb::default", "Installs MongoDB."
recipe "mongodb::relocate_dbpath", "Moves the MongoDB db data directory."
recipe "mongodb::start_mongodb", "Starts the mongodb daemon."
recipe "mongodb::stop_mongodb", "Stops the mongodb daemon."

attribute "mongodb", :display_name => "MongoDB", :type => "hash"

attribute "mongodb/release", 
  :display_name => "MongoDB new releases", 
  :description => "By default this recipe will install the default Ubuntu package.  To override: Set this attribute to use newer sources direct from mongodb.  Valid values are 'stable', 'unstable', or 'snapshot').", 
  :required => false, 
  :recipes => ["mongodb::default"],
  :choice => ['stable', 'unstable', 'snapshot']

attribute "mongodb/dbpath", 
  :display_name => "MongoDB dbpath", 
  :description => "The location of the MongoDB data.", 
  :required => false,
  :recipes => ["mongodb::relocate_dbpath", "mongodb::configure"],
  :default => '/mnt/storage',
  :choice => ['/mnt/storage']
