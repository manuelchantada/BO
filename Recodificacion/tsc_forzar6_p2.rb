
require 'clipboard'
require 'RAutomation'
require "C:\\macros\\recodificacion\\tsc.rb"
window = RAutomation::Window.new :title => "ZDGD_R2 - Reflection for UNIX and Digital"
lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R2.txt')
@ctr="C:\\macros\\tsc\\forzar_resultados.txt"

#WriteLn>c:\atsc\REP_FOR.txt,result,____inicio reporte bo____,%date% %time%,%line%,%ayuda0%,%resistencia%,%corrientecc%,%circlinea%,%voltajecc%,%voltajeca%,%referencia%,%corrpara%,%capacitanc%,%conductanc%,%conductanc%,%susceptanc%,%conductanc%,%ayuda1%,%ayuda2%,%resultado_prueba%,%reporte_averia_cliente%,%aislacion%,%aparatos%,%largo_cable%,%archivado%,%hora%,%forzado%,%forzado%
#____inicio reporte bo____,22/08/2014 11:57:27,1143862411,'','','','','','','','','','','','','','','','','','','','','','','',''


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
			forzado=0
	
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
	copiar(window)
		if (@a=~/#{@p32}/ or @a=~/#{@p2}/ or @a=~/#{@p3}/ or @a=~/#{@p4}/ or @a=~/#{@p5}/ or @a=~/#{@p6}/ or @a=~/#{@p7}/ or @a=~/#{@p8}/ or @a=~/#{@p9}/ or @a=~/#{@p10}/)
	    #		ctrl.puts linea+","+@a.lines.to_a[58].to_s.strip+","+@a.lines.to_a[71].to_s.strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+@a.lines.to_a[58].delete("|").delete(",").strip.strip.gsub(/,,/,",")+@a.lines.to_a[71].delete("|").delete(",").strip.gsub(/,,/,",")+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			ctrl.close
			count=1000
		end
	window.send_keys :enter
	sleep(2)
	



	until ( count>35 )
		count+=1
		copiar(window)
		sleep(1)			
		if (@a=~/forzar y probar/ and forzado==0)
			window.send_keys "f"
			forzado=1
			sleep(15)
		end
		if (@a=~/#{@p1}/ or @a=~/#{@p2}/ or @a=~/#{@p3}/ or @a=~/#{@p4}/ or @a=~/#{@p5}/ or @a=~/#{@p6}/ or @a=~/#{@p7}/ or @a=~/#{@p8}/ or @a=~/#{@p9}/ or @a=~/#{@p10}/)
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+@a.lines.to_a[58].delete("|").delete(",").strip.strip.gsub(/,,/,",")+@a.lines.to_a[71].delete("|").delete(",").strip.gsub(/,,/,",")+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			ctrl.close
			count=1000
		end
		if (@a=~/#{@p11}/ or @a=~/#{@p12}/ or @a=~/#{@p13}/ or @a=~/#{@p14}/ or @a=~/#{@p15}/ or @a=~/#{@p16}/ or @a=~/#{@p17}/ or @a=~/#{@p18}/ or @a=~/#{@p19}/ or @a=~/#{@p20}/)
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+@a.lines.to_a[58].delete("|").delete(",").strip.strip.gsub(/,,/,",")+@a.lines.to_a[71].delete("|").delete(",").strip.gsub(/,,/,",")+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			ctrl.close
			count=1000
		end
		if (@a=~/#{@p21}/ or @a=~/#{@p22}/ or @a=~/#{@p23}/ or @a=~/#{@p24}/ or @a=~/#{@p25}/ or @a=~/#{@p26}/ or @a=~/#{@p27}/ or @a=~/#{@p28}/ or @a=~/#{@p29}/ or @a=~/#{@p30}/)
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+@a.lines.to_a[58].delete("|").delete(",").strip.strip.gsub(/,,/,",")+@a.lines.to_a[71].delete("|").delete(",").strip.gsub(/,,/,",")+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			ctrl.close
			count=1000
		end
		if (@a=~/#{@p41}/ or @a=~/#{@p31}/ or @a=~/#{@p32}/ or @a=~/#{@p33}/ or @a=~/#{@p34}/ or @a=~/#{@p35}/ or @a=~/#{@p36}/ or @a=~/#{@p37}/ or @a=~/#{@p38}/ or @a=~/#{@p39}/ or @a=~/#{@p40}/)
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+@a.lines.to_a[58].delete("|").delete(",").strip.strip.gsub(/,,/,",")+@a.lines.to_a[71].delete("|").delete(",").strip.gsub(/,,/,",")+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			ctrl.close
			count=1000
		end
		if @a=~/resultado d/
			esperar "resultado d/prueba",window
			sleep(3)
			copiar(window)
			sleep(1)
			resultado_prueba=@a.lines.to_a[54].to_s.strip
			reporte_averia_cliente=@a.lines.to_a[56].to_s.strip
			aislacion=@a.lines.to_a[57].to_s.strip
			aparatos=@a.lines.to_a[58].to_s.strip
			largo_cable=@a.lines.to_a[59].to_s.strip
			archivado=""
			hora=""
			sleep(3)
			window.send_keys "m"
			sleep(3)
			esperar "resistencia:",window
			sleep(1)
			copiar(window)
			resistencia=@a.lines.to_a[56].to_s.strip
			corrientecc=@a.lines.to_a[57].to_s.strip
			circlinea=@a.lines.to_a[59].to_s.strip
			voltajecc=@a.lines.to_a[60].to_s.strip
			voltajeca=@a.lines.to_a[61].to_s.strip
			referencia=@a.lines.to_a[62].to_s.strip
			corrpara=@a.lines.to_a[65].to_s.strip
			capacitanc=@a.lines.to_a[66].to_s.strip
			susceptanc=@a.lines.to_a[67].to_s.strip
			conductanc=@a.lines.to_a[68].to_s.strip
			ayuda0=""
			ayuda2=""
			ayuda1=""
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____"+","+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+ayuda0+","+resistencia+","+corrientecc+","+circlinea+","+voltajecc+","+voltajeca+","+referencia+","+corrpara+","+capacitanc+","+conductanc+","+conductanc+","+susceptanc+","+conductanc+","+ayuda1+","+ayuda2+","+resultado_prueba+","+reporte_averia_cliente+","+aislacion+","+aparatos+","+largo_cable+","+archivado+","+hora+","+""+","+""
			ctrl.close
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
		if count==61
			ctrl=File.new @ctr,"a+"
			ctrl.puts "____inicio reporte bo____,"+Time.now.strftime("%d/%m/%Y %H:%M")+","+linea+","+@a.lines.to_a[58].delete("|").delete(",").strip.strip.gsub(/,,/,",")+@a.lines.to_a[71].delete("|").delete(",").strip.gsub(/,,/,",")+",,,,,,,,,,,,,,,,,,,,,,"
	    	puts linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			ctrl.close
		   	window.send_keys :f4
			sleep(1)
			window.send_keys :f2
			sleep(15)
		end	
	end
 	 
 	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)
	
end
