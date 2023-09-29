require "date"
require "logger"

require "json"
require "active_support/all"

require_relative "../backend/plugin_init.rb"

logger = Logger.new($stdout)

RSpec.describe do
  context "with plugin initialized" do
    it "serializes class references in hashes to strings" do
      test_hash = {test_date: Date}
      logger.info test_hash.method(:to_json)
      expect(test_hash.to_json).to eq('{"test_date":"Date"}')
    end
  end
end

