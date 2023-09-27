# https://stackoverflow.com/questions/683989/how-do-you-deal-with-the-conflict-between-activesupportjson-and-the-json-gem

module ActiveSupport
  module ToJsonWithActiveSupportEncoder
    def to_json(options = nil)
      super(options)
    end
  end
end
