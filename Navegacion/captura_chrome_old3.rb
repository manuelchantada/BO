#!/usr/bin/env ruby

# Detalles de la versión:
# Detecta clave expirada
# Evalua lotes por fecha de modificacion
# Detecta y cierra cartel de informacion
# Crea archivo de control de macro
# Timeouts ampliados
# Borra control.txt si se termina el lote
# Cuando existe un lote nuevo lo carga
# Función break, para esperar lote nuevo.
# Función alertalote, si espera por lote mas de 12 minutos copia archivo en carpeta de control
# Ejecuta ccleaner para borrar los perfiles viejos
# log.txt de errores, se borra al superar 100kb

require ARGV[0].to_s
require "watir-webdriver"
load "c:\\macros\\navegacion\\PDR_chrome.rb"
load "c:\\macros\\navegacion\\gral.rb"
@client = Selenium::WebDriver::Remote::Http::Default.new

# Borra LOG.txt
#if File.exists? 'c:\\atsc\\log.txt'
#	File.delete 'c:\\atsc\\log.txt'
#end

# Timeout navegador
@client.timeout = 300 # seconds – default is 60


#--------------------------COMIENZO DE EJECUCION
begin

	#Borrado de perfiles antiguos
	if File.exists? "C:\\CCleaner\\CCleaner.exe"
		`C:\\CCleaner\\CCleaner.exe /auto`
	else
		puts "------------------------ Falta C:\\CCleaner\\CCleaner.exe ------------------------"
		puts "--------------- No se borraran los perfiles antiguos del browser ---------------"
		sleep (300)
	end

	#----------------------APERTURA DE FIREFOX Y LOGUEO
	a=Watir::Browser.new :chrome, :http_client => @client


	# Tamaño y posicion del navegador
	a.window.resize_to(@width, @height)
	a.window.move_to(@xpos, @ypos)

	# Timeouts de objetos
	a.driver.manage.timeouts.implicit_wait = 60

	begin
		if (File.size @log) > 1000000
			File.delete @log
		end

		brake=File.new('c:\\atsc\\break',"a")
		brake.close
		puts "Ingresando al PDR"

		#INGRESO AL PDR
		resing=ingreso a,@user,@pass

		case resing
		when 0
		  puts "Ingreso ok"
		when 1
		 puts "Usuario o clave invalido"
		when 2
		 puts "No abre el PDR"
	 	sleep (300)
		when 3
		 puts "Error de ingreso"
	 	sleep (300)
	 when 4
		 puts "Clave expirada, modificarla en los sets"
	 	sleep (500)
		end

		# Copia @lote a local

		if File.exists? @lote
			if File.exists? 'c:\\atsc\\reg.txt'
				if File.mtime('c:\\atsc\\reg.txt')+1 < File.mtime(@lote)
					puts "-----Copiando lote nuevo #{@lote} "+Time.now.to_s.slice(0..15)+" -----"
					FileUtils.copy_file(@lote,'c:\\atsc\\reg.txt')
					File.delete @ctr
				end
			else
				FileUtils.copy_file(@lote,'c:\\atsc\\reg.txt')
			end
	    else
	    	puts "-----Copiando lote #{@lote} "+Time.now.to_s.slice(0..15)+" -----"
	    	File.delete @ctr
	    	FileUtils.copy_file(@lote,'c:\\atsc\\reg.txt')
	    	brake=File.new('c:\\atsc\\break',"a")
			brake.close
		end

		#-----------------------MANEJO DE @lote
		# Ver si existe control
		control=File.new(@ctr,"a+")
		if control.eof?
			reg=File.new('c:\\atsc\\reg.txt')
			else
			ultima=control.readline
		    reg=File.new('c:\\atsc\\reg.txt')
			reg.each_line do |li|
			break if (li[ultima])
			end
		end
		control.close
			

		#-----------------------COMIENZO DE CAPTURA
		a.goto "https://portalderelaciones.tasa.telefonica.com.ar/wps/myportal/!ut/p/b1/hc6xDoIwGATgJzK9toLtWKCUhgAaq2AXw2AMiYCD8fkF46RR_-2S7y4_8aQhfmjv3bm9dePQXubsw2NoSscKx2xSxCtYKYVzwR4QfAKHCeDLKfzr18Q_iQTPIys5ql3KYdUmy0qtOeLgHYAlMxCUplUIrPGxYPJoAoYVeusosHyBH0-W2difyLVv0NmFegAEiCiT/dl4/d5/L2dJQSEvUUt3QS80SmtFL1o2XzZHTlQyTVQySURERUYwSUwxQTkwTkszMDA3/"
		Watir::Wait.until {(a.text_field :name=>'ANI').exists?}

		while a.title == "Portal de Relacionamiento TASA"

			# Verifica que el lote sea actual o copia el nuevo
			if not File.exists? 'c:\\atsc\\break'
				    reg.close
					File.delete @ctr
					lotectr=0
					while File.mtime('c:\\atsc\\reg.txt') >= File.mtime(@lote)
					puts "Esperando lote nuevo"
					lotectr=lotectr+1
						if lotectr>6
							alertalote=File.new("\\\\tphp3233\\control\\Alertalote #{@lote.slice(18..30)}","a+")
							alertalote.puts "Lote actualizado por ultima vez a las #{File.mtime(@lote)}"
							alertalote.close
						end
					sleep(60)
					end
					if File.exists? "\\\\tphp3233\\control\\Alertalote #{@lote.slice(18..30)}"
						File.delete "\\\\tphp3233\\control\\Alertalote #{@lote.slice(18..30)}"
					end
					puts "-----Copiando lote nuevo #{@lote} "+Time.now.to_s.slice(0..15)+" -----"
				    brake=File.new('c:\\atsc\\break',"a")
				    brake.close
					FileUtils.copy_file(@lote,'c:\\atsc\\reg.txt')
					reg=File.new('c:\\atsc\\reg.txt')
			end

			# Controla que no sea final de archivo
			fileend reg,@ctr,@lote

			ani=(reg.readline)
			anis=(ani.slice(0..9))
			(a.text_field :name=>'ANI').set anis
			#sleep (4)
			(a.button :value=>'Consultar').click

			# Cierra boton informacion
			if 	(a.div :id=>'ibox_footer').text=="Informaci\u00F3n"
				(a.a :href=>'javascript:void(0)').click
				sleep(2)
			end
			
			# Ejecuta la funcion de captura
			rescap=captura a,ani,@captura
			control=File.new(@ctr,"w")
			control.write ani.slice(0..9)
			control.close

			# Control
			time=Time.now
		    timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
			controla=File.new(@ctrl,"w")
			controla.puts "#{@pc},#{timel},#{@pdr}"
			controla.close

			a.button(:value,"Nueva").click
			sleep(2)
				if a.alert.exists?
				puts "NUEVA-Alerta de browser!!!"
				#sleep(120)
				a.alert.ok
				end
			Watir::Wait.until {(a.text_field :name=>'ANI').exists?}
		end
	rescue Timeout::Error => e
		puts "TIMEOUT"
		time=Time.now
	    timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
	   	log=File.new(@log,"a+")
	   	log.puts "TIMEOUT "+timel+"-"+ani.slice(0..9)
	   	log.puts e.message
	   	log.puts e.backtrace.inspect
	   	log.puts "----------------------------------------------------------------------------"
		#a.button(:value,"Nueva").click
		a.screenshot.save 'c:\\atsc\\timeout.png'
		log.close
		retry
	end
		
rescue StandardError => e
	begin
		a.screenshot.save 'c:\\atsc\\excepcion.png'
	   	a.close
		rescue
	   	`taskkill /im chrome.exe /f /t >nul 2>&1`
    end
    puts "EXCEPCION"
	time=Time.now
    timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
   	log=File.new(@log,"a+")
   	if ani==nil
   		log.puts "EXCEPCION "+timel+"- Sin ANI"
   		else
   		log.puts "EXCEPCION "+timel+"-"+ani.slice(0..9)
   	end
   	log.puts e.message
   	log.puts e.backtrace.inspect
   	log.puts "----------------------------------------------------------------------------"
   	log.close
   	retry
end
