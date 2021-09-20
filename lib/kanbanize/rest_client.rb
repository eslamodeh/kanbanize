module Kanbanize
  module RestClient
    KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME = 'KANBANIZE_API_KEY'
    KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME = 'KANBANIZE_API_HOSTNAME'

    # return
    def get(_params = {})
      response = resource.get({ apiKey: api_key })

      JSON.parse(response.body)['data']
    rescue ::RestClient::ExceptionWithResponse => e
      data = JSON.parse(e.response.body)
      print_errors([data['error']['message']])
      nil
    end

    private

    def resource
      ::RestClient::Resource.new klass_url_path
    end

    def klass_url_path
      api_host_name + klass_name.downcase.pluralize
    end

    def klass_name
      name.demodulize
    end

    def api_key
      ENV[KANBANIZE_API_KEY_ENVIRONMENT_KEY_NAME]
    end

    def api_host_name
      ENV[KANBANIZE_API_HOSTNAME_ENVIRONMENT_KEY_NAME] + '/api/v2/'
    end
  end
end
