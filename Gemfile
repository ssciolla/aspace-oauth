# frozen_string_literal: true

ASpaceGems.setup if defined? ASpaceGems
source 'https://rubygems.org'

# Seem to need Rails to be specified or there"s an uninitialzed constant error
gem "rails", '~> 5.2'
gem "omniauth", '~> 2.1'
gem "omniauth-rails_csrf_protection", '~> 1.0'
gem 'omniauth_openid_connect', '~> 0', '>= 0.4'
gem 'addressable',   '~> 2.8'

# Pinning this resolves undefined method `[]' for #<OpenSSL::ASN1::Sequence:0x4bb0df3c>
gem "json-jwt", "1.13.0"
