
require 'clipboard'
require 'RAutomation'

window = RAutomation::Window.new :title => "ZDGD_P2 - Reflection for UNIX and Digital"
lote=File.new ('c:\\atsc\\forzar.txt')
@ctr="C:\\atsc\\forzar_resultados.txt"

p1="equipo ocupado"
p2="problema de comunicaci"
p3="comando rechazo"
p4="fall"
p5="probl.d/comunicaci"
p6="expira temporizador"
p7="s/pierde la conexi"
p8="se pierde conecci"
p9="pto.d/acceso n/disponible"
p10="se pierde la conexi"
p11="puerto no disponible"
p12="fallo conecci"
p13="respuesta invalida"
p14="probl.d/conexi"
p15="no hay una ltu disp."
p16="problema de acceso"
p17="n/ltu.disponible"
p18="problemas con ltu"
p19="nea vacante"
p20="sin respuesta de la central"
p21="respuesta inv"
p22="ta.x b - um i"
p23="falta la matriz"
p24="switch down"
p25="fallo  coneccion"
p26="n/ltu disponible"
p27="falta matriz externa"
p29="puerto no disp"
p30="respueta invalida"


while 1 
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
	window.send_keys linea
	puts linea
	window.send_keys :enter
	sleep(2)
	window.send_keys :enter
	sleep(10)
	window.send_keys [:alt,'a']
	window.send_keys [:control,:insert]
	a=Clipboard.paste
	window.mouse.move :x => 500, :y => 500
	window.mouse.click
	
		
	until (a=~/Resultado d/ or a=~/Problema/ or count>13)
		
		count=count+1
		sleep(5)
		
				
		if a=~/Forzar y Probar/
			window.send_keys "f"
			puts "forzando"
			sleep(15)
		end

		if (a=~/Problema/ or a=~/#{p1}/ or a=~/#{p3}/)
			ctrl.puts linea+","+a.lines.to_a[58].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			puts linea+","+a.lines.to_a[58].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")

		end
		if a=~/Resultado d/
			puts "Encontro Resultado de prueba"
			sleep(1)
			window.send_keys [:alt,'a']
	window.send_keys [:control,:insert]
	a=Clipboard.paste
	window.mouse.move :x => 500, :y => 500
	window.mouse.click
			#resultado=a.lines.to_a[54].to_s.strip.delete "\n\t"+","+a.lines.to_a[56].to_s.strip.delete "\n\t"+","+a.lines.to_a[57].to_s.strip.delete "\n\t"+","+a.lines.to_a[58].to_s.strip.delete "\n\t"+","+a.lines.to_a[59].to_s.strip.delete "\n\t"+","+a.lines.to_a[67].to_s.strip.delete "\n\t"+","+a.lines.to_a[68].to_s.strip.delete "\n\t"+","+a.lines.to_a[69].to_s.strip.delete "\n\t")
			#resultado=a.lines.to_a[54].to_s.strip.delete "\n\t"+","+a.lines.to_a[56].to_s.strip.delete "\n\t"+","+a.lines.to_a[57].to_s.strip.delete "\n\t"+","+a.lines.to_a[58].to_s.strip.delete "\n\t"+","+a.lines.to_a[59].to_s.strip.delete "\n\t"+","+a.lines.to_a[67].to_s.strip.delete "\n\t"+","+a.lines.to_a[68].to_s.strip.delete "\n\t"+","+a.lines.to_a[69].to_s.strip.delete "\n\t")
			resultado=a.lines.to_a[54].to_s.strip+","+a.lines.to_a[56].to_s.strip+","+a.lines.to_a[57].to_s.strip+","+a.lines.to_a[58].to_s.strip+","+a.lines.to_a[59].to_s.strip+","+a.lines.to_a[67].to_s.strip+","+a.lines.to_a[68].to_s.strip+","+a.lines.to_a[69].to_s.strip
			ctrl.puts ","+"resultado de prueba "+Time.now.strftime("%d/%m/%Y %H:%M")
			puts ","+resultado+","+Time.now.strftime("%d/%m/%Y %H:%M")
			
			window.send_keys "m"	
			sleep(1)	
			window.send_keys [:alt,'a']
	window.send_keys [:control,:insert]
	a=Clipboard.paste
	window.mouse.move :x => 500, :y => 500
	window.mouse.click
			resultado=a.lines.to_a[56].to_s.strip+","+a.lines.to_a[57].to_s.strip+","+a.lines.to_a[59].to_s.strip+","+a.lines.to_a[60].to_s.strip+","+a.lines.to_a[61].to_s.strip+","+a.lines.to_a[62].to_s.strip+","+a.lines.to_a[63].to_s.strip+","+a.lines.to_a[64].to_s.strip+","+a.lines.to_a[66].to_s.strip+","+a.lines.to_a[67].to_s.strip+","+a.lines.to_a[68].to_s.strip+","+a.lines.to_a[69].to_s.strip+","+a.lines.to_a[71].to_s.strip
			#resultado=a.lines.to_a[56].to_s.strip.delete "\n\t"+","+a.lines.to_a[57].to_s.strip.delete "\n\t"+","+a.lines.to_a[59].to_s.strip.delete "\n\t"+","+a.lines.to_a[60].to_s.strip.delete "\n\t"+","+a.lines.to_a[61].to_s.strip.delete "\n\t"+","+a.lines.to_a[62].to_s.strip.delete "\n\t"+","+a.lines.to_a[63].to_s.strip.delete "\n\t"+","+a.lines.to_a[64].to_s.strip.delete "\n\t"+","+a.lines.to_a[66].to_s.strip.delete "\n\t"+","+a.lines.to_a[67].to_s.strip.delete "\n\t"+","+a.lines.to_a[68].to_s.strip.delete "\n\t"+","+a.lines.to_a[69].to_s.strip.delete "\n\t"+","+a.lines.to_a[71].to_s.strip.delete "\n\t"
			ctrl.puts linea+","+resultado+Time.now.strftime("%d/%m/%Y %H:%M")
			#puts linea+","+resultado+","+Time.now.strftime("%d/%m/%Y %H:%M")

		#	puts a.lines.to_a[56]			puts a.lines.to_a[57]			puts a.lines.to_a[59]			puts a.lines.to_a[60]		  	puts a.lines.to_a[61]		  	puts a.lines.to_a[62]	  	puts a.lines.to_a[63]		  	puts a.lines.to_a[64]		    puts a.lines.to_a[66]		    puts a.lines.to_a[67]		    puts a.lines.to_a[68]		    puts a.lines.to_a[71] 		
		end		
	end
 	#ctrl.puts linea+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
	#puts linea+","+a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
 
 	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)
	ctrl.close
end

#|                 Problema de comunicaci¢n                 |
#Comando de rechazo de Central
#Equipo Ocupado
#Expir¢ temporizador respuesta de Central
#La l¡nea no puede probarse
#La l¡nea no puede probarse
#Reporte d/aver¡a d/cliente : No Aplicable
#Respuesta inv lida de la Central
#Se perdi¢ la conexi¢n con la Central

		
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