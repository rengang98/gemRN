require "gemRN/version"

module GemRN
  # Your code goes here...
  class << self
    def generate_password len = 8
      seed = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ['!', '@', '#', '$', '%', '.', '*'] * 4
      token = ""
      len.times { |t| token << seed.sample.to_s }
      token
    end

    def generate_utoken len = 8
      a = lambda { rand(36).to_s(36) }
      token = ""
      len.times { |t| token << a.call.to_s }
      token
    end

    def generate_tplay_id
      Date.today.to_s.split('-')[1..-1].join() << generate_utoken(6).upcase
    end

    def generate_order_uuid
      Date.today.to_s.split('-').join()[2..-1] << generate_utoken(5).upcase
    end
  end
end
