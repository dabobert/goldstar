TWITTER_CONFIG= YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]
