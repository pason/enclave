module AdvApi
  module V1
    class Client
      include ::HTTParty
      base_uri 'https://private-2e8649-advapi.apiary-mock.com'

      def map
        self.class.get("/map")
      end
    end
  end
end
