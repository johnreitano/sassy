require 'active_support/core_ext'
require 'active_support/encrypted_configuration'

# Define a production Kuby deploy environment
Kuby.define('sassy') do
  environment(:production) do
    # Because the Rails environment isn't always loaded when
    # your Kuby config is loaded, provide access to Rails
    # credentials manually.
    app_creds = ActiveSupport::EncryptedConfiguration.new(
      config_path: File.join('config', 'credentials.yml.enc'),
      key_path: File.join('config', 'master.key'),
      env_key: 'RAILS_MASTER_KEY',
      raise_if_missing_key: true
    )

    docker do
      # Configure your Docker registry credentials here. Add them to your
      # Rails credentials file by running `bundle exec rake credentials:edit`.
      credentials do
        username app_creds[:kuby][:docker_username]
        password app_creds[:kuby][:docker_password]
        email app_creds[:kuby][:docker_email]
      end

      # image_url 'johnreitano/sassy' # DockerHub
      image_url 'ghcr.io/johnreitano/sassy' # Github
    end

    kubernetes do
      # Add a plugin that facilitates deploying a Rails app.
      add_plugin :rails_app

      # Use Docker Desktop as the provider.
      # See: https://www.docker.com/products/docker-desktop
      #
      # Note: you will likely want to use a different provider when deploying
      # your application into a production environment. To configure a different
      # provider, add the corresponding gem to your gemfile and update the
      # following line according to the provider gem's README.
      provider :docker_desktop

      # provider :eks do
      #   region 'us-west-2'
      #   cluster_name 'sassy-eks-6wiCCCly'

      #   credentials(
      #     Aws::Credentials.new(
      #       app_creds[:aws][:access_key_id],
      #       app_creds[:aws][:secret_access_key]
      #     )
      #   )
      # end
    end
  end
end
