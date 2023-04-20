require_relative '../lib/scrapping'

describe 'scrapping' do 
  
  it '' do
    expect(scrapping).not_to be_empty # ceci permet de vérifié si mon array est vide .
    expect(scrapping.length).to be >= 2 # ceci permet de verifié si mon array est d'une certaine longueur ici superieur ou égale à 2.
    expect(scrapping.length).to be <= 21 # ceci permet de verifié si mon array est d'une certaine longueur ici superieur ou égale à 21.
  end
end
