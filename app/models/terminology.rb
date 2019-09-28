class Terminology < ApplicationRecord
  def translate(terminology)
    terminology.delete(terminology[0]).concat(terminology[0], "ay")
  end
end
