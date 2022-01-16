require "allure-cucumber"
require "appium_lib"

require "fileutils"

# Limpa os logs e os screenshots
FileUtils.rm_f(Dir.glob("logs/*.json"))
FileUtils.rm_f(Dir.glob("logs/*.png"))

caps = Appium.load_appium_txt file: File.expand_path("caps/android.txt", __dir__), verbose: true 
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object 
#acima nao precisa passar o driver, só usa o find_element direto, temos acessos aos metodos do Appium de forma nativa
#el1 = driver.find_elements(:id, "io.qaninja.android.twp:id/short_click")
#el1.click