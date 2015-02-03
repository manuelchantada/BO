


def copiar()
	window.send_keys [:alt,'a']
	window.send_keys [:control,:insert]
	a=Clipboard.paste
	window.mouse.move :x => 500, :y => 500
	window.mouse.click
	return a
end

#p1="Problema de comunicaci¢n"***********************
#p2="Comando de rechazo de Central"
#p3="Equipo Ocupado"
#p4="Expir¢ temporizador respuesta de Central"
#p5="La l¡nea no puede probarse"
#p6="Respuesta inv lida de la Central"
#p7="Se perdi¢ la conexi¢n con la Central"
p1="equipo ocupado"
p2="problema de comunicaci¢n"
p3="comando rechazo"
p4="falló la conexión"
p5="probl.d/comunicación"
p6="expira temporizador"
p7="s/pierde la conexión"
p8="se pierde coneccion"
p9="pto.d/acceso n/disponible"
p10="se pierde la conexión"
p11="puerto no disponible"
p12="fallo coneccion"
p13="respuesta invalida"
p14="probl.d/conexión"
p15="no hay una ltu disp."
p16="problema de acceso"
p17="n/ltu.disponible"
p18="problemas con ltu"
p19="línea vacante"
p20="sin respuesta de la central"
p21="respuesta inválida"
p22="ta.x b - um i"
p23="falta la matriz"
p24="switch down"
p25="fallo  coneccion"
p26="n/ltu disponible"
p27="falta matriz externa"
p28="24 ohms a tierra en central"
p29="puerto no disp central"
p30="puerto no disp"
p31="respueta invalida"
