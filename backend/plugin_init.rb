# Patch ActiveSupport to_json implementation so it uses the json gem version of the method
# that is expected by the Sinatra backend. This patch counteracts the effect of ActiveSupport
# which was introduced by multiple gems needed by this plugin.

# If you do not have this patch, at least one endpoint in the backend (/reports) will have changed output
# that will break a template in the frontend.
# To reproduce the issue, when logged in with a user with repository access,
# visit http://localhost:8080/jobs/new?job_type=report_job

# Resources
# - https://stackoverflow.com/questions/683989/how-do-you-deal-with-the-conflict-between-activesupportjson-and-the-json-gem
# - https://github.com/rails/rails/blob/v5.2.8/activesupport/lib/active_support/core_ext/object/json.rb

module ActiveSupport
  module ToJsonWithActiveSupportEncoder
    def to_json(options = nil)
      super(options)
    end
  end
end
