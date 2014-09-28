module WebsocketRails
  class InternalEvents
    def self.events
      Proc.new do
        subscribe :pong, :to => InternalController, :with_method => :do_pong
      end
    end
  end

  class InternalController < BaseController
    include Logging

    def do_pong
      connection.pong = true
    end
  end
end
