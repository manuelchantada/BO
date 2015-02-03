lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R1.txt')
while 1 
	if lote.eof?
		lote.close
		lote=File.new ('\\\\cgtec\\PRUEBA\\FORZAR_R1.txt')
	else
		
			puts lote.readline.slice(0..10).to_s.delete "\n\t"
		sleep(1)
		

	end
end