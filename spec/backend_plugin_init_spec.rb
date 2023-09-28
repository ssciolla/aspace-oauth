require "date"
require_relative '../backend/plugin_init'

RSpec.describe do
  context "with plugin initialized" do
    it "serializes class references in hashes to strings" do
      test_hash = {test_date: Date}
      expect(test_hash.to_json).to eq(
        '{"test_date":"Date"}'
      )
    end
  end
end

