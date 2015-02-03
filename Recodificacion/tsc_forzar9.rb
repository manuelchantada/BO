require 'clipboard'
require 'RAutomation'
require "C:\\macros\\recodificacion\\tsc.rb"

	window = RAutomation::Window.new :title => "ZDGD_R2 - Reflection for UNIX and Digital"
	if window.exists?
		lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R2.txt')
	else
		window = RAutomation::Window.new :title => "ZDGD_R1 - Reflection for UNIX and Digital"
		if window.exists?
				lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R1.txt')
			else
			window = RAutomation::Window.new :title => "ZDGD_P1 - Reflection for UNIX and Digital"
				if window.exists?
					lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_P1.txt')
				else
				window = RAutomation::Window.new :title => "ZDGD_P2 - Reflection for UNIX and Digital"
				if window.exists?
					lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_P2.txt')
				end
			end
		end
	end

while 1

@ctr="C:\\macros\\tsc\\forzar_resultados.txt"
begin
	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)
end

while  Time.now.strftime("%H").to_i<6 and  Time.now.strftime("%H").to_i>22
	sleep(1000)
end


	if lote.eof?
	lote.close
	window = RAutomation::Window.new :title => "ZDGD_R2 - Reflection for UNIX and Digital"
		if window.exists?
			lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R2.txt')
		else
			window = RAutomation::Window.new :title => "ZDGD_R1 - Reflection for UNIX and Digital"
			if window.exists?
					lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R1.txt')
				else
				window = RAutomation::Window.new :title => "ZDGD_P1 - Reflection for UNIX and Digital"
					if window.exists?
						lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_P1.txt')
					else
					window = RAutomation::Window.new :title => "ZDGD_P2 - Reflection for UNIX and Digital"
					if window.exists?
						lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_P2.txt')
					end
				end
			end
		end

	else
	
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

			
	
	count=0
	@linea=lote.readline.slice(0..10).to_s.delete "\n\t"
#puts @linea


	window.send_keys :f4
	sleep(1)
	window.send_keys :f2
	sleep(1)
	window.send_keys "d"
	sleep(1)
	window.send_keys "e"
	sleep(1)
	window.send_keys @linea
	sleep(1)
	window.send_keys :enter
	sleep(2)
	copiar(window)
		if (@a=~/#{@p1}/ or @a=~/#{@p2}/ or @a=~/#{@p3}/ or @a=~/#{@p4}/ or @a=~/#{@p5}/ or @a=~/#{@p6}/ or @a=~/#{@p7}/ or @a=~/#{@p8}/ or @a=~/#{@p9}/ or @a=~/#{@p10}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if (@a=~/#{@p11}/ or @a=~/#{@p12}/ or @a=~/#{@p13}/ or @a=~/#{@p14}/ or @a=~/#{@p15}/ or @a=~/#{@p16}/ or @a=~/#{@p17}/ or @a=~/#{@p18}/ or @a=~/#{@p19}/ or @a=~/#{@p20}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if (@a=~/#{@p21}/ or @a=~/#{@p22}/ or @a=~/#{@p23}/ or @a=~/#{@p24}/ or @a=~/#{@p25}/ or @a=~/#{@p26}/ or @a=~/#{@p27}/ or @a=~/#{@p28}/ or @a=~/#{@p29}/ or @a=~/#{@p30}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if (@a=~/#{@p41}/ or @a=~/#{@p31}/ or @a=~/#{@p32}/ or @a=~/#{@p33}/ or @a=~/#{@p34}/ or @a=~/#{@p35}/ or @a=~/#{@p36}/ or @a=~/#{@p37}/ or @a=~/#{@p38}/ or @a=~/#{@p39}/ or @a=~/#{@p40}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
	window.send_keys :enter
	sleep(2)
	



	until ( count>35 )
		count+=1
		copiar(window)
		sleep(1)			
		if ((@a=~/forzar y probar/  or @a=~/resultado monitoreo d/) and @forzado==0)
			window.send_keys "f"
			@forzado=1
			sleep(15)
		end
		if (@a=~/#{@p1}/ or @a=~/#{@p2}/ or @a=~/#{@p3}/ or @a=~/#{@p4}/ or @a=~/#{@p5}/ or @a=~/#{@p6}/ or @a=~/#{@p7}/ or @a=~/#{@p8}/ or @a=~/#{@p9}/ or @a=~/#{@p10}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if (@a=~/#{@p11}/ or @a=~/#{@p12}/ or @a=~/#{@p13}/ or @a=~/#{@p14}/ or @a=~/#{@p15}/ or @a=~/#{@p16}/ or @a=~/#{@p17}/ or @a=~/#{@p18}/ or @a=~/#{@p19}/ or @a=~/#{@p20}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if (@a=~/#{@p21}/ or @a=~/#{@p22}/ or @a=~/#{@p23}/ or @a=~/#{@p24}/ or @a=~/#{@p25}/ or @a=~/#{@p26}/ or @a=~/#{@p27}/ or @a=~/#{@p28}/ or @a=~/#{@p29}/ or @a=~/#{@p30}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if (@a=~/#{@p41}/ or @a=~/#{@p31}/ or @a=~/#{@p32}/ or @a=~/#{@p33}/ or @a=~/#{@p34}/ or @a=~/#{@p35}/ or @a=~/#{@p36}/ or @a=~/#{@p37}/ or @a=~/#{@p38}/ or @a=~/#{@p39}/ or @a=~/#{@p40}/)
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
			count=1000
		end
		if @a.include? "resultado d/prueba"
			esperar "resultado d/prueba",window
			sleep(3)
			copiar(window)
			sleep(1)
			@resultado_prueba=@a.lines.to_a[54].to_s.strip
			@reporte_averia_cliente=@a.lines.to_a[56].to_s.strip
			@aislacion=@a.lines.to_a[57].to_s.strip
			@aparatos=@a.lines.to_a[58].to_s.strip
			@largo_cable=@a.lines.to_a[59].to_s.strip
			@archivado=""
			@hora=""
			sleep(3)
			window.send_keys "m"
			sleep(3)
			esperar "resistencia:",window
			sleep(1)
			copiar(window)
			@resistencia=@a.lines.to_a[56].to_s.strip
			@corrientecc=@a.lines.to_a[57].to_s.strip
			@circlinea=@a.lines.to_a[59].to_s.strip
			@voltajecc=@a.lines.to_a[60].to_s.strip
			@voltajeca=@a.lines.to_a[61].to_s.strip
			@referencia=@a.lines.to_a[62].to_s.strip
			@corrpara=@a.lines.to_a[65].to_s.strip
			@capacitanc=@a.lines.to_a[66].to_s.strip
			@susceptanc=@a.lines.to_a[67].to_s.strip
			@conductanc=@a.lines.to_a[68].to_s.strip
						
			grabar()
			
			puts @linea+",  --Con resultado-- ," +Time.now.strftime("%d/%m/%Y %H:%M")
			sleep(1)
			window.send_keys :f4
			sleep(1)
			window.send_keys :f2
			sleep(3)
			count=1000
		end		
		if count==61
			puts @linea+","+(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip+","+Time.now.strftime("%d/%m/%Y %H:%M")
			@ayuda0=(@a.lines.to_a[58]+@a.lines.to_a[71]).delete("|").delete(",").strip
			grabar()
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
	end
	
	