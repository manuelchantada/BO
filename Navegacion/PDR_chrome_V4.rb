

#INGRESA AL PDR/
# Resultados de la funcion
# 0=Exito al abrir PDR
# 1=Usuario o clave invalidos
# 2=No abre el PDR
# 3=Error de ingreso
# 3=Clave expirada

def ingreso(browser,user,pass)
browser.driver.manage.timeouts.implicit_wait = 60
browser.goto "https://portalderelaciones.tasa.telefonica.com.ar/wps/myportal/!ut/p/b1/hc6xDoIwGATgJzK9toLtWKCUhgAaq2AXw2AMiYCD8fkF46RR_-2S7y4_8aQhfmjv3bm9dePQXubsw2NoSscKx2xSxCtYKYVzwR4QfAKHCeDLKfzr18Q_iQTPIys5ql3KYdUmy0qtOeLgHYAlMxCUplUIrPGxYPJoAoYVeusosHyBH0-W2difyLVv0NmFegAEiCiT/dl4/d5/L2dJQSEvUUt3QS80SmtFL1o2XzZHTlQyTVQySURNQzcwSTk5OFRUNVYwMEM0"
if (browser.button :type=>'submit').exists?
	browser.text_field(:name=>'usuario').set(user)
	browser.text_field(:name=>'password').set(pass)
	browser.button(:type=>'submit').click
	if (browser.button :value=>'Consultar').exists?
			return 0
		else
			if (browser.span :class=>"wpsFieldSuccessText").text == " Usuario o clave inv\u00E1lidos"
				return 1
				else
          if (browser.div :class=>"wpsStatusMsg").text==" Clave expirada"
            return 4
          else
					   browser.screenshot.save 'c:\\error.png'
					   return 3
           end
			end
	end
else
	return 1
end
end

#REGENERA/

# Resultados de la funcion
# 0=no hay boton de Regenerar
# 1=exito
# 2=regenerar en masa
# 3=error al regenerar


def regenera(browser)
 browser.driver.manage.timeouts.implicit_wait = 90
  if (browser.button :caption=>'Regenerar').exist?
     (browser.button :caption=>'Regenerar').click
    Watir::Wait.until {(browser.button :caption=>'Si').exists?}
    if (browser.button :caption=>'Si').exists?
       (browser.button :caption=>'Si').click
       browser.driver.manage.timeouts.implicit_wait=360
       
      Watir::Wait.until {(browser.button :caption=>'Aceptar').exists?}
        if (browser.button :caption=>'Aceptar').exists?
          if (browser.div :class=>'popupContent').text =="Regenerar en Agregador\n Regeneraci\u00F3n de servicio realizado.\nAceptar"
             (browser.button :caption=>'Aceptar').click
              return 1              
            else
              (browser.button :caption=>'Aceptar').click	
              return 3                 
            end
        else
          return 3
        end
    else
     if	(browser.div :class=>'popupContent').text =="Regenerar servicio\nUtilice el sistema MASA para regenerar el servicio\nAceptar"
     (browser.button :caption=>'Aceptar').click
     return 2
 	 else
 	 end
    end
  else
   return 0 
  end
 end

# CAPTURA
#Detalles de la versión:
#Recorta al momento de la captura el texto
#Si sale alerta de browser la acepta
#Contempla los que vienen con una columna de mas
#Contemplado cambio en el HTML de PDR

def captura(browser,num,capt) 
     cont=0
    until cont>2 do
      
      time=Time.now
      timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
      browser.driver.manage.timeouts.implicit_wait = 90
      Watir::Wait.until {(browser.div :class=>'v-table-caption-container v-table-caption-container-align-center').exists?}
      sleep(5)
      sincro=(browser.div :class=>'v-fieldsetPanel', :index=>1).text
      conex=(browser.div :id=>'v-Z7_6GNT2MT2I5LHC0IJVKAC7010G4').text
      
        if (sincro!=nil && conex!=nil && conex.lines.to_a[9..60]!=nil) 
          captura=File.new(capt,"a+")
          
            if not (sincro.match /Sincronizado: \n(.+?)\n/m)==nil then
              captura.write num.slice(0..9)+","+num.slice(11..29) +","+ timel
              captura.write ",#{(sincro.match /Sincronizado: \n(.+?)\n/m)[1]}"
              captura.write ",#{(sincro.match /d\u00EDa: \n(.+?)\n/m)[1]}"
              captura.write ",#{(sincro.match /Estabilidad: \n(.+?)\n/m)[1]}"
              captura.write ","+(conex.lines.to_a[7..60].join.to_s).gsub(/\n/,",").gsub(/Fin de Ses,/,"").gsub(/Terminaci\u00F3n,/,"")
              else
                if not (sincro.match /Sin conectividad(.+?)\n/m)==nil then
                  captura.write num.slice(0..9)+","+num.slice(11..29)+","+ timel
                  captura.write ",S/C"
                  captura.write ",N/D"
                  captura.write ",N/D"
                  captura.write ","+(conex.lines.to_a[9..60].join.to_s).gsub(/\n/,",")
                  else
                  captura.write num.slice(0..9)+","+num.slice(11..29)+","+ timel
                  captura.write ",N/D"
                  captura.write ",N/D"
                  captura.write ",N/D"
                  captura.write ","+(conex.lines.to_a[7..60].join.to_s).gsub(/\n/,",").gsub(/Fin de Ses,/,"").gsub(/Terminaci\u00F3n,/,"")               
                end
            end

          captura.puts
          captura.close
          cont=2
          puts "Capturado #{num.slice(0..9)} OK"
          return 1
          else
          cont=cont+1
          puts "Capturado #{num.slice(0..9)} sin datos, intento #{cont}"
          if cont>2
            captura=File.new(capt,"a+")
            captura.write num.slice(0..9)+","+num.slice(11..29)+ ","+timel
            captura.write",Sin datos"
            captura.write ",S/D,S/D,S/D"
            captura.puts
            puts "Capturado #{num.slice(0..9)} Sin datos"
            captura.close
            return 0
            else
            (browser.button :value=>'Recargar').click
            if browser.alert.exists?
               puts "Alerta de browser!!!"
               browser.alert.ok
               sleep(3)
            end
            Watir::Wait.until {(browser.div :class=>'v-table-caption-container v-table-caption-container-align-center').exists?}
          end
        end
    end
end



