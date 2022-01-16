# Executar: Cucumber
Quando('acesso o Menu') do
    #find_element(xpath: "//android.widget.ImageButton[@content-desc='Open navigation drawer']")
   # hamburguer = "//android.widget.ImageButton[@content-desc='Open navigation drawer']"
   # find_element(xpath: hamburguer).click # foi la para o components
   @nav.tap_hamburguer #@nav foi definido em hooks
end
  
Então('vejo a lista de opções de navegação') do 
    #displayed = true
    #find_element(id: "io.qaninja.android.twp:id/navView").displayed? #metodo booleano
  #  menu = find_element(id: "io.qaninja.android.twp:id/rvNavigation")
  #  expect(menu.displayed?).to be true #pergunto se o metodo list tem a propriedade displayed
  expect(@nav.list.displayed?).to be true
end

#POM (Page Object Model)
#SOM (Screen Object Model)[]