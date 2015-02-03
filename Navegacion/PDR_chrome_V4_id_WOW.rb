


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
     if (browser.div :class=>'popupContent').text =="Regenerar servicio\nUtilice el sistema MASA para regenerar el servicio\nAceptar"
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
#Captura conexiones y sincro por tabla
#Elmementos por ID

def captura(browser,num,capt) 

  def capturaconex(browser)
    if ((browser.div :id=>"v-Z7_6GNT2MT2I5LHC0IJVKAC7010G4").text!="No fue posible realizar la operaci\u00F3n. Por favor reintente m\u00E1s tarde.") then
      filas=(browser.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").table(:class =>"v-table-table").rows.length
      capt=""
        if filas<5
          for i in 0..filas-1
            capt=capt+(browser.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").table(:class =>"v-table-table")[i].text.gsub(/\n/,",")+","
          end

          if capt.length <50
            return 0
          else
           return capt
          end

        else
          for i in 0..4
            capt=capt+(browser.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").table(:class =>"v-table-table")[i].text.gsub(/\n/,",")+","
          end
            if capt.length <50
             return 0
            else
              return capt
            end
        end
    else
      return 0
    end
  end

  def capturasincro(browser)
    if (browser.div(:id=>"portlet_ns_Z7_6GNT2MT2IDDEF0IL1A90NK30G3_")).exists?

      tabla=browser.div(:id=>"portlet_ns_Z7_6GNT2MT2IDDEF0IL1A90NK30G3_").table(:class=>"v-table-table",:index=>1)

      if tabla.rows.length>4
        sincro=","+tabla[0][1].text+","+tabla[3][1].text+","+tabla[4][1].text+","
        return sincro
      else
        if (browser.div(:id=>"portlet_ns_Z7_6GNT2MT2IDDEF0IL1A90NK30G3_").text.match /Sin conectividad(.+?)\n/m)!=nil
          return ",S/C,N/D,N/D,"
        else
          return 0
        end
      end
    else
      return 0
    end
  end



  cont=0
  sincro=0
  conex=0
  until cont>2 or (sincro!=0 && conex!=0) do     
    time=Time.now
    timel=time.day.to_s+"/"+time.month.to_s+"/"+time.year.to_s+" "+time.hour.to_s+":"+time.min.to_s+":"+time.sec.to_s
    browser.driver.manage.timeouts.implicit_wait = 90
    Watir::Wait.until {(browser.div :class=>'v-table-caption-container v-table-caption-container-align-center').exists?}
    sleep(5)

    #Captura sincro, resincro y estabilidad.
    sincro=capturasincro browser
    conex=capturaconex browser

    # Falta algún dato?
    if (sincro==0 or conex==0)
      cont=cont+1
      puts "Capturado #{num.slice(0..9)} sin datos, intento #{cont}"
      if cont>2
        captura=File.new(capt,"a+")
        captura.write num.slice(0..9)+","+num.slice(11..29)+ ","+timel
        if sincro!=0
          captura.write sincro
        else
          captura.write",Sin datos,S/D,S/D,"
          puts "Capturado #{num.slice(0..9)} Sin datos de sincro"
        end
        if conex!=0
          captura.write conex
        else
          captura.write "Sin datos de conexion,"
          puts "Capturado #{num.slice(0..9)} Sin datos de conexiones"
        end
        captura.puts
        captura.close
      else
        (browser.button :value=>'Recargar').click
        if browser.alert.exists?
           puts "Alerta de browser!!!"
           browser.alert.ok
           sleep(3)
        end
        Watir::Wait.until {(browser.div :class=>'v-table-caption-container v-table-caption-container-align-center').exists?}
      end
    else
      #Tengo todos los datos
      captura=File.new(capt,"a+")
      captura.write num.slice(0..9)+","+num.slice(11..29)+ ","+timel
      captura.write sincro
      captura.write conex
      captura.puts
      captura.close
      puts "Capturado #{num.slice(0..9)} OK"
    end
  end
end
