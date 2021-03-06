require 'fileutils'

if Rails.env.development? and ENV['server_mode']
  cache_path = Rails.root.join('tmp/cache/assets/development')
  FileUtils.rm_rf(cache_path)

  listener = Listen.to(Rails.root.join('app/assets/components'), only: %r{.slim$}) do |modified, added, removed|
    # clearing cache
    FileUtils.rm_rf(cache_path)
  end
  listener.start
end

# Load custom helpers for precompile
Sprockets::Context.send :include, Standalone::DiligenceTextHelper

