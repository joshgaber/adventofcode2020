module Day4
  class Passport
    VALID_FIELDS = %w[byr iyr eyr hcl ecl pid hgt].freeze
    VALID_HEIGHTS = (150..193).map { |r| "#{r}cm" } + (59..76).map { |r| "#{r}in" }
    VALID_EYE_COLORS = %w[amb blu brn gry grn hzl oth].freeze

    def initialize(details)
      @fields = details.split(/\s/).to_h { |f| f.split ':' }.select { |k, _v| VALID_FIELDS.include? k }
    end

    def all_fields?
      @fields.count == 7
    end

    def all_fields_valid?
      all_fields? &&
        (1920..2002).include?(byr.to_i) &&
        (2010..2020).include?(iyr.to_i) &&
        (2020..2030).include?(eyr.to_i) &&
        hcl.match?(/^#[0-9a-f]{6}$/) &&
        VALID_EYE_COLORS.include?(ecl) &&
        pid.match?(/^\d{9}$/) &&
        VALID_HEIGHTS.include?(hgt)
    end

    VALID_FIELDS.map do |field|
      define_method(field) do
        @fields[field]
      end
    end
  end
end
