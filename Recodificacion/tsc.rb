

@log="C:\\macros\\tsc\\forzar_log.txt"
@ctr="C:\\macros\\tsc\\forzar_resultados.txt"
	
def copiar(window)

	window.send_keys [:alt,'a']
	sleep(0.5)
	window.send_keys [:control,:insert]
	sleep(0.5)
	@a=Clipboard.paste.downcase
	sleep(0.5)
	window.mouse.move :x => 500, :y => 500
	sleep(0.5)
	window.mouse.click
	sleep(0.5)
end

def esperar(texto,window)
	count=0
	window.send_keys [:alt,'a']
	window.send_keys [:control,:insert]
	@a=Clipboard.paste.downcase
	window.mouse.move :x => 500, :y => 500
	window.mouse.click
	while not (@a=~/#{texto}/ or count==30)
		count+=1
		sleep(2)
	end
end

def grabar()
	ctrl=File.new @ctr,"a+"
	ctrl.puts "____inicio reporte bo____"+","+Time.now.strftime("%d/%m/%Y %H:%M")+","+@linea+","+@ayuda0+","+@resistencia+","+@corrientecc+","+@circlinea+","+@voltajecc+","+@voltajeca+","+@referencia+","+@corrpara+","+@capacitanc+","+@conductanc+","+@conductanc+","+@susceptanc+","+@conductanc+","+@ayuda1+","+@ayuda2+","+@resultado_prueba+","+@reporte_averia_cliente+","+@aislacion+","+@aparatos+","+@largo_cable+","+@archivado+","+@hora+","+" "+","+" "
	#WriteLn>c:\atsc\REP_FOR.txt,result,____inicio reporte bo____,%date% %time%,                               %line%,%ayuda0%,%resistencia%,%corrientecc%,%circlinea%,%voltajecc%,%voltajeca%,                      %referencia%,%corrpara%,%capacitanc%,%conductanc%,%conductanc%,%susceptanc%,%conductanc%,%ayuda1%,%ayuda2%,%resultado_prueba%,%reporte_averia_cliente%,%aislacion%,%aparatos%,%largo_cable%,                   %archivado%,%hora%,%forzado%,%forzado%
	ctrl.close		
end
@linea=""
@archivado=""
@hora=""
@ayuda0=""
@ayuda1=""
@ayuda2=""
@resultado_prueba=""
@reporte_averia_cliente=""
@aislacion=""
@aparatos=""
@largo_cable=""
@resistencia=""
@corrientecc=""
@circlinea=""
@voltajecc=""
@voltajeca=""
@referencia=""
@corrpara=""
@capacitanc=""
@susceptanc=""
@conductanc=""
@forzado=0


@p1="equipo ocupado"
@p2="problema de comunicaci"
@p3="comando rechazo"
@p4="fall"
@p5="error datos"
@p6="expira temporizador"
@p7="xima de sesiones de prueba en uso"
@p8="se pierde conecci"
@p9="n/disponible"
@p10="central no disponible"
@p11="puerto de acceso a la Central no est" #disponible
@p12="fallo conecci"
@p13="inv"   #respuesta invalida
@p14="problema de conexi"
@p15="ltu"
@p16="interface"
@p17="problema de acceso"
@p18="n con la central"
@p19="nea vacante"
@p20="sin respuesta de la central"
@p21="respuesta inv"
@p22="no hay tensi"
@p23="matriz"
@p24="switch down"
@p25="fallo  conecci"
@p26="problema de comunicac"
@p27="puerto no disp"
@p28="respueta invalida"
@p29="lida de la cent"
@p30="pueto no dispo"
@p31="no puede probarse"
@p32="problema del sistema"
@p33="temporizador respuesta de Central"
@p34="puerto d/"
@p35="error interno"
@p36="error otros"
@p37="error sistema"
@p38="mal en central"
@p39="lida de central"
@p40="configurado"
@p41="comando de rechazo de central"