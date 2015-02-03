
require ARGV[0].to_s
require "watir-webdriver"
require "c:\\Macros\\recodificacion\\gpym.rb"


@client = Selenium::WebDriver::Remote::Http::Default.new
# Timeout navegador
@client.timeout = 60 # seconds – default is 60
#sleep(3000)



# if File.exists? @lote
# 	if File.mtime('c:\\atsc\\recod.txt')+1 < File.mtime(@lote)
# 		puts "-----Copiando lote nuevo #{@lote} "+Time.now.to_s.slice(0..15)+" -----"
# 		FileUtils.copy_file(@lote,'c:\\atsc\\recod.txt')
# 		# if File.exists? @ctr
# 		# 	File.delete @ctr
# 		# end
# 	end
# end

lote=File.new ('c:\\atsc\\recod.txt')

begin

	#Borrado de perfiles antiguos
	if File.exists? "C:\\CCleaner\\CCleaner.exe"
		`C:\\CCleaner\\CCleaner.exe /auto`
	else
		puts "------------------------ Falta C:\\CCleaner\\CCleaner.exe ------------------------"
		puts "--------------- No se borraran los perfiles antiguos del browser ---------------"
		sleep (300)
	end


	a=Watir::Browser.new :firefox, :http_client => @client 

	# Tamaño y posicion del navegador
	a.window.resize_to(800, 950)
	a.window.move_to(0, 0)
	# Timeouts de objetos	
	a.driver.manage.timeouts.implicit_wait = 60
	
		if File.mtime('c:\\atsc\\recod.txt')+1 < File.mtime(@lote)
			puts "-----Copiando lote nuevo #{@lote} "+Time.now.to_s.slice(0..15)+" -----"
			FileUtils.copy_file(@lote,'c:\\atsc\\recod.txt')
			lote=File.new ('c:\\atsc\\recod.txt')
			# if File.exists? 
			# 	File.delete @ctr
			# end
	
		else
			puts "Esperando lote nuevo"
			sleep(6000)
		end	
	begin
		if (File.size @log) > 1000000
			File.delete @log
		end
		if (File.size @ctr) > 3000000
			time=Time.now
			date=time.day.to_s+time.month.to_s
			@ctr2='c:\\atsc\\control_reco'+time.day.to_s+'_'+time.month.to_s+'.txt'
			FileUtils.copy_file(@ctr,@ctr2)
			File.delete @ctr
		end


		while a.title!="Gestion de Provisi\u00F3n y Mantenimiento"
			ingreso(a)
		end
		cumplimentable=""
		ctrl=File.new @ctr,"a+"
		h=1
		while h==1
			
			if lote.eof?
				lote.close

				if File.exists? @lote
					if File.mtime('c:\\atsc\\recod.txt')+1 < File.mtime(@lote)
						
						puts "-----Copiando lote nuevo #{@lote} "+Time.now.to_s.slice(0..15)+" -----"
						FileUtils.copy_file(@lote,'c:\\atsc\\recod.txt')
						lote=File.new ('c:\\atsc\\recod.txt')
						# if File.exists? 
						# 	File.delete @ctr
						# end
					else
						puts "Esperando lote nuevo"
						sleep(200)
					end
				end
			else
				if a.text_field(:name, "idCriterio").exists?
						a.text_field(:name, "idCriterio").set==""
						#Clasificado OK
					else
						#Error en la clasificacion
				end

				linea=lote.readline
				actividad=linea.slice(0..8).to_s.delete "\n\t"
				ani=linea.slice(14..24).to_s.delete "\n\t"
				falta_numero=linea.slice(10..13).to_s.delete "\n\t"
				ticket=linea.slice(25..40).to_s.delete "\n\t"

				print ani +" - "+ (linea.slice(10..13).to_s.delete "\n\t")

				a.text_field(:name, "idCriterio").set actividad
				a.element(:title, "Buscar").click

				if a.text.include?("CUMPLIMENTABLE") == true
					#Puts "esta cumplimentable"
					cumplir a
					#sleep(3)
					if a.alert.exists?
						a.alert.ok 
					end

		            a.textarea(:name, "textObservacion").set "BO_" +falta_numero +" "+ticket
					
						case falta_numero
							when "4125"
								if a.table(:class=>"fila-tabla-par").text.include?("TELEG") == true 
									falta="PROBADO BIEN"
								else
									falta="CLIENTE NO CONTESTA"	
								end	
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
							when "3001"
									falta="DERIVAR A PENDIENTES MASIVOS BO"
						end				# case  faltra numero

						seleccion a,falta
						begin
							a.execute_script "validateData()"
							sleep(2)
							cumplimentable=",CUMPLIDO"
						rescue
							# if #Error
							# else
							puts "Reitentando confirmar"
							
							retry
						end
		 		else
		 			puts ",No operable o stand by"
		 			a.execute_script a.td(:id, "td_1_2").attribute_value("onclick")
		 			cumplimentable=",No operable o stand by"
		 		end
		 		time=Time.now
				timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
				ctrl.puts ani+","+actividad+","+falta_numero+","+timel+cumplimentable

				control_macros_gpym=File.new(@control_macros_gpym,"w+")
   				control_macros_gpym.puts ENV["COMPUTERNAME"]+","+timel
  			   	control_macros_gpym.close


			end
		end
	rescue Timeout::Error => e
		puts "TIMEOUT"
		time=Time.now
	    timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
	   	log=File.new(@log,"a+")
	   	log.puts "TIMEOUT "+timel+"-"+ani
	   	log.puts e.message
	   	log.puts e.backtrace.inspect
	   	log.puts "----------------------------------------------------------------------------"
		#a.button(:value,"Nueva").click
		a.screenshot.save 'c:\\atsc\\timeout_reco.png'
		log.close

		a.execute_script a.td(:id, "td_1_2").attribute_value("onclick")
		
		sleep(2)
		retry
	end
rescue  StandardError => e
	begin
		a.screenshot.save 'c:\\atsc\\excepcion_reco.png'
	   	a.close
		rescue
	   	`taskkill /im firefox.exe /f /t >nul 2>&1`
    end
	time=Time.now
    timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
   	log=File.new(@log,"a+")
   	if ani==nil
   		log.puts "EXCEPCION "+timel+"- Sin ANI"
   		else
   		log.puts "EXCEPCION "+timel+"-"+ani
   	end
   	log.puts e.message
   	log.puts e.backtrace.inspect
   	log.puts "----------------------------------------------------------------------------"
   	log.close
   	retry
end
			