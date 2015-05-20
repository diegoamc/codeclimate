module CC
  module Analyzer
    class Issue

      def self.from_hash(source_buffer, doc)
        IssueAdapter.new(source_buffer, doc).to_issue
      end

      attr_reader :message
      attr_reader :location
      attr_reader :fingerprint
      attr_reader :attrs

      def initialize(check, message, location, fingerprint, remediation_points = 1_000, attrs = {})
        @check = check
        @message = message
        @location = location
        @fingerprint = fingerprint
        @remediation_points = remediation_points
        @attrs = attrs
      end

      def begin_pos
        location.begin_pos
      end

      def as_json
        {
          check:              @check,
          message:            @message,
          fingerprint:        @fingerprint,
          remediation_points: @remediation_points,
          location:           @location.as_json
        }
      end

    end
  end
end