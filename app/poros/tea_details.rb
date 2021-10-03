class TeaDetails 
  attr_reader :name,
              :description,
              :temperature,
              :brew_time

  def initialize(tea_hash)
    @name = tea_hash[:name]
    @description = tea_hash[:description]
    @temperature = tea_hash[:temperature]
    @brew_time = tea_hash[:brew_time]
  end
end