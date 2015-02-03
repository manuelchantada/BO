


	require "watir-webdriver"
	require "C:\\Ruby193\\gpym.rb"


	@client = Selenium::WebDriver::Remote::Http::Default.new
# Timeout navegador
	@client.timeout = 60 # seconds – default is 60
	a=Watir::Browser.new :firefox, :http_client => @client 
   #a=Watir::Browser.new :chrome, :http_client => @client ,:switches => ['--ignore-certificate-errors'
# Tamaño y posicion del navegador
#a.window.resize_to(@width, @height)
#a.window.move_to(@xpos, @ypos)

# Timeouts de objetos
	
	a.driver.manage.timeouts.implicit_wait = 60


ingreso(a)
		
#a.execute_script "runMenu('-338a1397:1475300447d:-7f2a')"
# consultar y resolver 



#ingreso(a)

#file = File.new("c:\\recodifica\\id.txt", "r") 
 #     while (line = file.gets) 
    #        puts "#{counter}: #{line}" 
     #       counter = counter + 1 
    #    	idactividad=file.gets.slice(0..8)
file = File.open("\\\\cgtec\\PRUEBA\\RECODIFICAR.txt", "r")
lines = file.readlines()
#a.text_field(:name, "idCriterio").set lines[0].slice(0..8).to_s
filas=11   #lines.length
#for i in 3..filas-1
i=1
	puts "recodificar " + (lines[i].slice(0..8).to_s) +" - "+ (lines[i].slice(10..13).to_s.delete "\n\t")
	#puts "recodificar" + lines[1].slice(0..8).to_s 
	#puts  lines[1].slice(10..13).to_s.delete "\n\t"
	
	a.text_field(:name, "idCriterio").set lines[i].slice(0..8).to_s
	a.element(:title, "Buscar").click
 #sleep (3)
	#if not a.element(:class=>"titleError").exists?
	#	puts "ESTADO NO OPERABLE"
		

		#######if a.table(:class=>"fila-tabla-par", :index=>1)[3][3].text=="CUMPLIMENTABLE"
		
			if a.text.include?("CUMPLIMENTABLE") == true

				#Puts "esta cumplimentable"
				cumplir a
				#sleep(3)
				if a.alert.exists?
					a.alert.ok 
				end

	            a.textarea(:name, "textObservacion").set "bo_obs"
				#a.button(:src, "/gpm/images/lupa.gif").click
				#a.text_field(:name, "textObservacion").set "bo_obs"

				#a.button(:src, "/gpm/images/lupa.gif").click
			
						#falta_numero=lines[i].slice(10..13).to_s
				falta_numero=lines[i].slice(10..13).to_s.delete "\n\t"
					case falta_numero		
						when "4108"
							falta="FALTA EN CENTRAL"
						when "202"
							falta="CORTO CIRCUITO"
						when "201"
							falta="SIN CIRCUITO"
						when "4105"	
							falta="SIN TONO PI"
						when "204"
								falta="LIGADO"
						when "205"
								falta="RUIDO"
						when "203"
								falta="TIERRA"
					end				# case  faltra numero

					seleccion a,falta
	 		else
	 			#NO CUMPLIMENTABLE
	 		end

			a.execute_script("validateData()")
			#a.button(:title=>"Confirmar").click

			if a.text_field(:name, "idCriterio").exists?
				a.text_field(:name, "idCriterio").set==""
				#Clasificado OK
			else
				#Error en la clasificacion
			end
		#CONRFIRMAR

			
		########end


	#else
#Estado no operable
	#end
	





#a.text_field(:name, "idCriterio").set idactividad.to_s
