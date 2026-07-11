# Add any other gitlab.rb configuration here, each on its own line
external_url ENV['external_url']
letsencrypt['enable'] = false
gitlab_workhorse['listen_network'] = "unix"
gitlab_workhorse['listen_addr'] = "/var/opt/gitlab/gitlab-workhorse/sockets/socket"
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'unicode'
gitlab_rails['db_collation'] = nil
gitlab_rails['db_database'] = 'gitlab'
gitlab_rails['db_username'] = 'gitlab'
gitlab_rails['db_password'] = ENV['DB_PASSWORD']
gitlab_rails['db_host'] = 'gitlab_db'
gitlab_rails['db_port'] = 5432
gitlab_rails['db_sslmode'] = 'prefer'
gitlab_rails['initial_root_password'] = ENV['INITIAL_ROOT_PASSWORD']
