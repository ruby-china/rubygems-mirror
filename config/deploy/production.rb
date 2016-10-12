server 'us0.gems.ruby-china.org', user: 'ubuntu', roles: %w{app}
server 'us1.gems.ruby-china.org', user: 'ubuntu', roles: %w{app}

set :unicorn_rack_env, 'production'
