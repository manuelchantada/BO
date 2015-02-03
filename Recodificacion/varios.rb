a.tr(:class=>"titleError").exists? #MOtivo no encontrado




Timeout::timeout(2) do
a.button(:src, "/gpm/images/lupa.gif").click
end
rescue Timeout::Error => msg
put "Salida por timeout"
end




element=browser.element(:name=>"descripcionMotivo")

script = "return arguments[0].value = 'LIGADO'"

browser.execute_script(script, element)