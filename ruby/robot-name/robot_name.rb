require 'set'

class NameGenerator
  MaximumNamesGeneratedError = Class.new(StandardError)

  ALPHABET = "A".upto("Z").to_a
  DIGITS = 0.upto(9).to_a

  DEFAULT_TEMPLATE = [ALPHABET, ALPHABET, DIGITS, DIGITS, DIGITS]

  def initialize(seed: Random.new_seed, template: DEFAULT_TEMPLATE)
    @used_names = Set.new
    @random_number_generator = Random.new(seed)
    @template = template
  end

  def generate
    if @used_names.size >= max_size
      raise MaximumNamesGeneratedError,
        "No more names can be generated with the current template #{template.inspect}"
    end

    name = random_name while @used_names.include?(name)
    @used_names.add(name)

    name
  end

  private

  def random_name
    @template.map { |items| sample(items) }.join
  end

  def sample(items)
    items.sample(random: @random_number_generator)
  end

  def max_size
    @max_size ||= @template.map(&:size).reduce(:*)
  end
end

class Robot
  DEFAULT_GENERATOR = NameGenerator.new

  attr_reader :name

  def initialize(name_generator = DEFAULT_GENERATOR)
    @name_generator = name_generator

    reset
  end

  def reset
    @name = @name_generator.generate
  end
end
