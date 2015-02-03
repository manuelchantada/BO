
# Apreta boton cumplir de la telegestion
def cumplir(browser)
	tabla=browser.table(:class=>"fila-tabla-par-gris")
	filas=tabla.rows.length
	for i in 0..filas-1
	  if (tabla[i][2].text=='TELEGESTIONAR')
	    tele=i
	  end
	end
	tabla[tele][7].tr(:title=>"Cumplir").click

	if browser.alert.exists?
		browser.alert.ok
		puts " - Ya cumplido"
	else
		puts " - Cumplido"
	end
end




def seleccion(browser,falta)
	Timeout::timeout(2) do
	browser.button(:src, "/gpm/images/lupa.gif").click
	end
rescue Timeout::Error => msg
	browser.windows.last.use
	pos=browser.text.lines.to_a.index(falta+"  \n")-2
	browser.radio(:name=>"descripcionMotivoRadioButtons", :index=>pos).click
	browser.execute_script "cerrarVentana()"
	browser.windows.first.use
end



def ingreso(a)

	a.goto "https://idsrvint.telefonica.com.ar/public/usercenterTasa/login.html"
 
		(a.frame:src=>"loginUC.html").send_keys "xsj039"

		(a.frame:src=>"loginUC.html").send_keys :tab

		(a.frame:src=>"loginUC.html").send_keys "German28"
		sleep(3)
		puts "login"
		a.send_keys [:alt,:shift,'l']
		sleep(3)
		#a.execute_script "javascript:document.form1.submit()"

		puts "redireccionando"
		a.goto "http://serve133.sote.telefonica.com.ar/gpm/index.do"
		sleep(2)
		
		a.execute_script a.td(:id, "td_1_2").attribute_value("onclick")
		#a.td(:id, "td_1").when_present.hover
		sleep(2)
		#a.td(:id, "td_1_2").when_present.click
	# if a.text_field(:name, "idCriterio").exists?
	# 	return 1
	# else
	# 	return 0
	# end

end


