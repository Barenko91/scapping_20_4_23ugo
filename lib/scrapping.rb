require "nokogiri"
require "rubocop"
require "open-uri"

def scrapping 

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto = []
currencies = []
jp = []



1.upto(20) do |i| # cette loop permet de dire "de 1 à 20 tu vas à chaque index(index étant mon page.xpath) me prendre chaque index et me le mettre dans l'array currenties" pratique.


currencies << page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a/span").to_s.gsub('<span>$','').gsub('</span>','') # ici j'ai fait une méthode permettant de selectionner uniquement dans la page web toute les noms de crypto voulue .
#.to_s me permet de transformer les float(nombre avec virgule)en string puis .gsub permet de supprimer les champs du code selectionner dans les ().

crypto << page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").to_s.gsub('<div class="">','').gsub('</div>','')

end
cryp_current = Hash[crypto.zip(currencies)]# j'ai créé une hash nommé crypt_current qui regroupe crypto et currencies cette technique me permet de lier 2 array en 1 hash suivant l'odre crypto puis currenties uniquement si les élément sont dans le meme ordre dans les 2 array.

jp = cryp_current.map{|nom, valeur| {nom => valeur}} # ici je viens de diviser ma hash dans une array en plusieur hash contenant {|nom(crypto),valeur(currencies) et la je leur demande de l'écrire inscit {nom => valeur}}.

return jp
end

scrapping