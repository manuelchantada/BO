
require 'clipboard'
require 'RAutomation'
window = RAutomation::Window.new :title => "ZDGD_R2 - Reflection for UNIX and Digital"
lote=File.new ('c:\\macros\\tsc\\forzar.txt')
@ctr="C:\\macros\\tsc\\forzar_resultados.txt"

#WriteLn>c:\atsc\REP_FOR.txt,result,____inicio reporte bo____,%date% %time%,%line%,%ayuda0%,%resistencia%,%corrientecc%,%circlinea%,%voltajecc%,%voltajeca%,%referencia%,%corrpara%,%capacitanc%,%conductanc%,%conductanc%,%susceptanc%,%conductanc%,%ayuda1%,%ayuda2%,%resultado_prueba%,%reporte_averia_cliente%,%aislacion%,%aparatos%,%largo_cable%,%archivado%,%hora%,%forzado%,%forzado%
#____inicio reporte bo____,22/08/2014 11:57:27,1143862411,'','','','','','','','','','','','','','','','','','','','','','','',''
forzado=""
p1="equipo ocupado"
p2="problema de comunicaci"
p3="comando rechazo"
p4="la conexi"
p5="error datos"
p6="expira temporizador"
p7="xima de sesiones de prueba en uso"
p8="se pierde conecci"
p9="disponible"
p10="central no disponible"
p11="puerto no disponible"
p12="fallo conecci"
p13="respuesta invalida"
p14="problema de conexi"
p15="no hay una ltu dis"
p16="interface"
p17="problema de acceso"
p18="problemas con ltu"
p19="nea vacante"
p20="sin respuesta de la central"
p21="respuesta inv"
p22="ta.x b - um i"
p23="matriz"
p24="switch down"
p25="fallo  conecci"
p26="ltu disponible"
p27="puerto no disp"
p28="respueta invalida"
p29="lida de la cent"
p30="pueto no dispo"
p31="no puede probarse"
p32="problema del sistema"
p33="exipira temporizador"
p34="puerto"
p35="error "
p36="otros"
p37="ltu"
p38="mal en central"
p39="lida de central"
p40="configurado"
p41="comando de rechazo de central"


	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)


while 1 


			resultado_prueba=""
			reporte_averia_cliente=""
			aislacion=""
			aparatos=""
			largo_cable=""

			resistencia=""
			corrientecc=""
			circlinea=""
			voltajecc=""
			voltajeca=""
			referencia=""
			corrpara=""
			capacitanc=""
			susceptanc=""
			conductanc=""

	ctrl=File.new @ctr,"a+"
	count=0
	linea=lote.readline.slice(0..10).to_s.delete "\n\t"
	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)
	window.send_keys "d"
	sleep(1)
	window.send_keys "e"
	sleep(1)
	window.send_keys linea
	sleep(1)
	window.send_keys :enter
	sleep(2)
	window.send_keys :enter
	sleep(2)
	window.send_keys [:alt,'a']
	window.send_keys [:control,:insert]
	a=Clipboard.paste.downcase
	window.mouse.move :x => 500, :y => 500
	window.mouse.click




	until ( count>60 )
		count=count+1
		window.send_keys [:alt,'a']
		window.send_keys [:control,:insert]
		a=Clipboard.paste.downcase
		window.mouse.move :x => 500, :y => 500
		window.mouse.click
		
		sleep(3)			
		if a=~/forzar y probar/
			window.send_keys "f"
			sleep(15)
		end
		if (a=~/#{p1}/ or a=~/#{p2}/ or a=~/#{p3}/ or a=~/#{p4}/ or a=~/#{p5}/ or a=~/#{p6}/ or a=~/#{p7}/ or a=~/#{p8}/ or a=~/#{p9}/ or a=~/#{p10}/)
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+a.lines.to_a[58].delete("|").strip+","+a.lines.to_a[71].to_s.strip+",,,,,,,,,,,,,,,,,,,,,,"
	    #		ctrl.puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			puts linea+","+a.lines.to_a[58].to_s.delete("|").strip+a.lines.to_a[71].to_s.delete("|").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			count=1000
		end
		if (a=~/#{p11}/ or a=~/#{p12}/ or a=~/#{p13}/ or a=~/#{p14}/ or a=~/#{p15}/ or a=~/#{p16}/ or a=~/#{p17}/ or a=~/#{p18}/ or a=~/#{p19}/ or a=~/#{p20}/)
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+a.lines.to_a[58].delete("|").strip+","+a.lines.to_a[71].to_s.strip+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+a.lines.to_a[58].to_s.delete("|").strip+a.lines.to_a[71].to_s.delete("|").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			count=1000
		end
		if (a=~/#{p21}/ or a=~/#{p22}/ or a=~/#{p23}/ or a=~/#{p24}/ or a=~/#{p25}/ or a=~/#{p26}/ or a=~/#{p27}/ or a=~/#{p28}/ or a=~/#{p29}/ or a=~/#{p30}/)
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+a.lines.to_a[58].delete("|").strip+","+a.lines.to_a[71].to_s.strip+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+a.lines.to_a[58].to_s.delete("|").strip+a.lines.to_a[71].to_s.delete("|")..strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			count=1000
		end
		if (a=~/#{p41}/ or a=~/#{p31}/ or a=~/#{p32}/ or a=~/#{p33}/ or a=~/#{p34}/ or a=~/#{p35}/ or a=~/#{p36}/ or a=~/#{p37}/ or a=~/#{p38}/ or a=~/#{p39}/ or a=~/#{p40}/)
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+a.lines.to_a[58].delete("|").strip+","+a.lines.to_a[71].to_s.strip+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+a.lines.to_a[58].to_s.delete("|").strip+a.lines.to_a[71].to_s.delete("|").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			count=1000
		end

		if a=~/resultado d/
			
			sleep(1)
			window.send_keys [:alt,'a']
			window.send_keys [:control,:insert]
			a=Clipboard.paste.downcase
			window.mouse.move :x => 500, :y => 500
			window.mouse.click
			sleep(1)
			#resultado1=a.lines.to_a[54].to_s.strip+","+a.lines.to_a[56].to_s.strip+","+a.lines.to_a[57].to_s.strip+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[59].to_s.strip+","+a.lines.to_a[67].to_s.strip+","+a.lines.to_a[68].to_s.strip+","+a.lines.to_a[69].to_s.strip
			resultado_prueba=a.lines.to_a[54].to_s.strip
			reporte_averia_cliente=a.lines.to_a[56].to_s.strip
			aislacion=a.lines.to_a[57].to_s.strip
			aparatos=a.lines.to_a[58].to_s.strip
			largo_cable=a.lines.to_a[59].to_s.strip
			archivado=""
			hora=""
						#ctrl.puts ","+resultado+Time.now.strftime("%d/%m/%Y %H:%M")
			#puts ","+resultado+","+Time.now.strftime("%d/%m/%Y %H:%M")
			window.send_keys "m"	
			sleep(3)	
			window.send_keys [:alt,'a']
			window.send_keys [:control,:insert]
			a=Clipboard.paste.downcase
			window.mouse.move :x => 500, :y => 500
			window.mouse.click
			resistencia=a.lines.to_a[56].to_s.strip
			corrientecc=a.lines.to_a[57].to_s.strip
			circlinea=a.lines.to_a[59].to_s.strip
			voltajecc=a.lines.to_a[60].to_s.strip
			voltajeca=a.lines.to_a[61].to_s.strip
			referencia=a.lines.to_a[62].to_s.strip
			corrpara=a.lines.to_a[65].to_s.strip
			capacitanc=a.lines.to_a[66].to_s.strip
			susceptanc=a.lines.to_a[67].to_s.strip
			conductanc=a.lines.to_a[68].to_s.strip
			ayuda0=""
			ayuda2=""
			ayuda1=""
			ctrl.puts "____inicio reporte bo____"+","+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+ayuda0+","+resistencia+","+corrientecc+","+circlinea+","+voltajecc+","+voltajeca+","+referencia+","+corrpara+","+capacitanc+","+conductanc+","+conductanc+","+susceptanc+","+conductanc+","+ayuda1+","+ayuda2+","+resultado_prueba+","+reporte_averia_cliente+","+aislacion+","+aparatos+","+largo_cable+","+archivado+","+hora+","+""+","+""
			#ctrl.puts linea+","+resultado1+","+resultado2+","+Time.now.strftime("%d/%m/%Y %H:%M")
			#puts linea+","+resultado+","+Time.now.strftime("%d/%m/%Y %H:%M")
			puts linea+",  --Con resultado-- ," +Time.now.strftime("%d/%m/%Y %H:%M")
			sleep(1)
			window.send_keys :f4
			sleep(1)
			window.send_keys :f2
			sleep(3)
			count=1000
		#	puts a.lines.to_a[56]			puts a.lines.to_a[57]			puts a.lines.to_a[59]			puts a.lines.to_a[60]		  	puts a.lines.to_a[61]		  	puts a.lines.to_a[62]	  	puts a.lines.to_a[63]		  	puts a.lines.to_a[64]		    puts a.lines.to_a[66]		    puts a.lines.to_a[67]		    puts a.lines.to_a[68]		    puts a.lines.to_a[71] 		
		end		
	end
 	 
 	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)
	ctrl.close
end

# if a=~/Forzar y Probar/
	# 	window.send_keys "f"
	# 	puts "forzando"
	# 	sleep(15)
	# end
	# if a=~/Problema/
	# 	puts a.lines.to_a[71] 
	# 	puts "Encontro problema"
	# end
	# if a=~/Resultado d/
	# 	puts "Encontro Resultado de prueba"
	# 	sleep(1)
	# 	Clipboard.clear
	# 	window.send_keys [:alt,'a']
	# 	window.send_keys [:control,:insert]
	# 	a=Clipboard.paste
	# 	a.lines.to_a[54]
	# end
		
#Equipo Ocupado 
#Forzar y Probar
#F orzar y Probar
#resultado de preba 
# a.lines.to_a[50]
#expiró temporizador respuesta de Central
#Clipboard.copy text
#Clipboard.paste
#Clipboard.clear
  #expiro ayuda1
#{VAR1}
#puts a.lines.to_a[54]
			#puts a.lines.to_a[56]
			#puts a.lines.to_a[57]
			#puts a.lines.to_a[58]
			#puts a.lines.to_a[59]
			#puts a.lines.to_a[67]
			#puts a.lines.to_a[68]
			#puts a.lines.to_a[69]



# 			if (a=~/#{p1}/ or a=~/#{p2}/ or a=~/#{p3}/ or a=~/#{p4}/ or a=~/#{p5}/ or a=~/#{p6}/ or a=~/#{p7}/ or a=~/#{p8}/ or a=~/#{p9}/ or a=~/#{p10}/)
# 			ctrl.puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
# 			puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
# 		end
# 	if (a=~/#{p11}/ or a=~/#{p12}/ or a=~/#{p13}/ or a=~/#{p14}/ or a=~/#{p15}/ or a=~/#{p16}/ or a=~/#{p17}/ or a=~/#{p18}/ or a=~/#{p19}/ or a=~/#{p20}/)
# 			ctrl.puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
# 			puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
# 		end
# 	if (a=~/#{p21}/ or a=~/#{p22}/ or a=~/#{p23}/ or a=~/#{p24}/ or a=~/#{p25}/ or a=~/#{p26}/ or a=~/#{p27}/ or a=~/#{p28}/ or a=~/#{p29}/ )
# 			ctrl.puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
# 			puts linea+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
# 		end

