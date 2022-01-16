#Botoes de Radio
Dado('que acesso a tela Botões de Radio') do
    @nav.tap_hamburguer
    @nav.tap_by_text("INPUTS")
    @nav.tap_by_text("BOTÕES DE RADIO")
end
  
Quando('eu escolho a opção Ruby') do
    @radio_locator = "//android.widget.RadioButton[contains(@text, 'Ruby')]"
    find_element(xpath: @radio_locator).click
end
  
Então('esta opção deve ser marcada') do
    @radio_result = find_element(xpath: @radio_locator)
  #  expect(@radio_result.checked).to be true #o appium retornou como string em vez de booleano, esta entre aspas
  expect(@radio_result.checked).to eql "true"
end
#=====================================================================================
Dado("que acesso a tela Checkbox") do
    @nav.tap_hamburguer
    @nav.tap_by_text("INPUTS")
    @nav.tap_by_text("CHECKBOX")
end

Quando("eu marco a opção Ruby") do
    @check_locator = "//android.widget.CheckBox[contains(@text, 'Ruby')]"
    find_element(xpath: @check_locator).click        
end
        
Então("esta opção deve estar marcada") do
    @check_result = find_element(xpath: @check_locator)
  #  expect(@radio_result.checked).to be true #o appium retornou como string em vez de booleano, esta entre aspas
    expect(@check_result.checked).to eql "true"        
end

Quando("eu marco as seguintes techs:") do |table|
    @techs = table.hashes #transforma a tabela em um array do ruby
    log(@techs)

    @techs.each do |item| #percorre a lista de itens e mostra na tela
        log(item["tech"])
        check_locator = "//android.widget.CheckBox[contains(@text, '#{item["tech"]}')]"
        find_element(xpath: check_locator).click
    end
end

Então("todas essas opções devem estar marcadas") do
    @techs.each do |item|
        check_locator = "//android.widget.CheckBox[contains(@text, '#{item["tech"]}')]"
        check_result = find_element(xpath: check_locator)
        expect(check_result.checked).to eql "true"
    end
end