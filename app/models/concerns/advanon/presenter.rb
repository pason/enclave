module Advanon
  module Presenter
    ASCII_MAPPINGS = {1 => 'x', 2 => '-'}.freeze

    def to_ascii
      to_square.map do |row|
        row.map do |v|
          ASCII_MAPPINGS[v]
        end
      end.map(&:join).join("\n").strip
    end
  end
end