# frozen_string_literal: true

namespace :sentinel do
  desc "Send a simulated test error to Sentinel Engine"
  task test_ping: :environment do
    puts "=================================================="
    puts "Volt Sentinel Engine — Test Ping (Portal Agro)"
    puts "=================================================="
    puts "Endpoint: #{VoltSentinelClient.configuration.endpoint}"
    puts "Project:  #{VoltSentinelClient.configuration.project_name}"
    puts "API Key:  #{VoltSentinelClient.configuration.api_key ? VoltSentinelClient.configuration.api_key[0..7] + '...' : 'NOT SET'}"

    simulated_error = StandardError.new("Simulated Ping Incident from Portal Agro [#{Time.now.utc.iso8601}]")
    simulated_error.set_backtrace([
      "lib/tasks/sentinel.rake:12:in `block (2 levels) in <top (required)>'",
      "vendor/bundle/ruby/rake/task.rb:270:in `execute'",
      "bin/rails:4:in `<main>'"
    ])

    puts "\nDispatching test incident to Sentinel..."
    response = VoltSentinelClient.notify(
      simulated_error,
      context: {
        trigger: "rake sentinel:test_ping",
        environment: Rails.env.to_s,
        test_run_at: Time.now.utc.iso8601
      },
      sync: true
    )

    if response.is_a?(Net::HTTPSuccess)
      puts "[SUCCESS] HTTP #{response.code}: Incident successfully ingested by Sentinel!"
      puts "Response: #{response.body}"
    elsif response.nil?
      puts "[FAILURE] Request failed or endpoint was unreachable (rescued gracefully)."
    else
      puts "[WARNING] Endpoint returned HTTP #{response.code}: #{response.body}"
    end
    puts "=================================================="
  end
end
