# frozen_string_literal: true

module Jekyll
  module Drops
    module Plugins
      class Badges < Liquid::Drop
        KONG_INC = 'kong-inc'

        def initialize(metadata:, publisher:) # rubocop:disable Lint/MissingSuper
          @metadata = metadata
          @publisher = publisher
        end

        def konnect?
          !!@metadata['konnect']
        end

        def oss?
          !!@metadata['free'] && @publisher == KONG_INC
        end

        def enterprise?
          !!@metadata['enterprise']
        end

        def premiumpartner?
          !!@metadata['premiumpartner']
        end

        def hash
          "publisher:#{@publisher}-" \
            "konnect:#{konnect?}-" \
            "enterprise:#{enterprise?}-" \
            "premiumpartner:#{premiumpartner?}-" \
            "oss:#{oss?}"
        end
      end
    end
  end
end
