class Pairing < ApplicationRecord

  attr_accessor :wine

  has_one :food


  def get_wine(wine_klass)
    @wine = wine_klass.where(MATCHES[food.flavour])
  end

  def get_sweet_x_sour_wine(wine_klass)
    @wine = wine_klass.where('sweet >= 5 and acid >= 7.5')
  end

  def get_sweet_x_bitter_wine(wine_klass)
    @wine = wine_klass.where('sweet >= 5 and bitter <= 2.5 and fruity >= 4 and acid >= 7.5')
  end

  def get_sweet_x_spicy_wine(wine_klass)
    @wine = wine_klass.where('sweet >= 5 and herby <= 2.5 and fruity >= 4.5 and acid >= 7.5')
  end

  def get_sour_x_bitter_wine(wine_klass)
    @wine = wine_klass.where('oaky <= 2.5 and bitter <= 2.5 and acid >= 5')
  end

  def get_sour_x_spicy_wine(wine_klass)
    @wine = wine_klass.where('sweet >= 5 and bitter <= 2.5 and alcohol <= 5')
  end

  private

    MATCHES = {
      sweet: 'sweet >= 5',
      spicy: 'sweet >= 2.6 and sweet <= 5 and fruity >= 5.1 and acid >= 5.1 and alcohol <= 5',
      sour: 'sweet >= 5 and bitter <= 2.5 and oaky <= 2.5',
      umami: 'sweet >= 5 and bitter <= 2.5 and fruity >= 5',
      bitter: 'bitter <= 2.5 and oaky <= 2.5',
      umami_x_sweet: 'fruity >= 5 and acid >= 2.6 and acid <= 5',
      umami_x_sour: 'oaky <= 5 and acid >= 7.5',
      umami_x_bitter: 'bitter <= 2.5 and oaky <= 2.5',
      sweet_x_sour: 'sweet >= 5 and acid >= 7.5',
    }

end
