

def fileend(reg,ctr,lote)
	if reg.eof?
		reg.close
		puts 'Se termino el lote actual'
		#BORRAR ARCHIVO DE CONTROL
		if File.exists? ctr
			File.delete  ctr
		end
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
			if File.exists? "\\\\tphp3233\\control\\Alertalote #{lote.slice(18..30)}"
				File.delete "\\\\tphp3233\\control\\Alertalote #{lote.slice(18..30)}"
			end
		puts "-----Copiando lote nuevo #{lote} "+Time.now.to_s.slice(0..15)+" -----"
		FileUtils.copy_file(lote,'c:\\atsc\\reg.txt')
		reg=File.new('c:\\atsc\\reg.txt')
		else
	end
end

def franja(horainicio,horafin)
	while (Time.now.hour>horafin or Time.now.hour<=horainicio)
  	puts "Esperando a la hora de inicio"
  	sleep(600)
	end	
end