# frozen_string_literal: true

module AspaceOauth
  def self.build_url(host, path, query = {})
    URI::HTTPS.build(
      host: URI(host).host,
      path: path,
      query: query.is_a?(Hash) ? URI.encode_www_form(query) : query
    ).to_s
  end

  def self.cas_logout_url
    config = get_oauth_config_for('cas')
    return unless config

    host   = config[:config][:url]
    path   = config[:config][:logout_url]
    params = { service: AppConfig[:frontend_proxy_url] }
    build_url(host, path, params)
  end

  def self.get_email(auth)
    email = nil
    if auth[:info].key?(:email) && !auth[:info][:email].nil?
      email = auth[:info][:email]
    elsif auth[:extra].key?(:email) && !auth[:extra][:email].nil?
      email = auth[:extra][:email]
    elsif auth[:extra].key?(:response_object)
      if auth[:extra][:response_object].name_id
        email = auth[:extra][:response_object].name_id
      end
    end
    email
  end

  def self.get_oauth_config_for(strategy)
    AppConfig[:oauth_definitions].find { |oauth| oauth[:provider] == strategy }
  end

  def self.saml_logout_url
    config = get_oauth_config_for('saml')
    return unless config

    build_url(
      AppConfig[:frontend_proxy_url],
      "#{AppConfig[:frontend_proxy_prefix]}auth/saml/spslo"
    )
  end

  def self.use_uid?
    AppConfig.has_key?(:oauth_idtype) && AppConfig[:oauth_idtype] == :uid
  end

  def self.username_is_email?
    AppConfig.has_key?(:oauth_username_is_email) && AppConfig[:oauth_username_is_email] == true
  end

  def self.openid_connect_logout_url
    config = get_oauth_config_for('openid_connect')
    return unless config

    uri = URI(config[:config][:client_options][:end_session_endpoint])
    build_url(uri.to_s, uri.path, uri.query)
  end
end
