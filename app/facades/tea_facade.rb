class TeaFacade
  def self.get_one_tea(query) 
    tea_hash = TeaService.find_tea(query)
    TeaDetails.new(tea_hash) 
  end 
end