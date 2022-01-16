Dado('que acesso a tela de Login') do
    @nav.tap_hamburguer
    @nav.tap_by_text("FORMS")
    @nav.tap_by_text("LOGIN")
end
  
Quando('submeto minhas credenciais:') do |table|
    user = table.rows_hash  #transforma uma tabela em um objeto do tipo hash: chave, valor
    log(user) #imprimir na tela, recurso do cucumber, tem o puts tmb...
    @login.sign_in(user[:email], user[:senha])
    sleep 5 #temporario
end
  
Então('devo ver a notificação: {string}') do |notice|
    #log(get_source) #obtem o codigo da pagina na execucao, o xml da tela
    #toast = find_element(xpath: "//android.widget.Toast")
    expect(@toaster.toast.text).to eql notice
end