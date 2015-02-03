Titulo recomendacion
a.span(:class=> "v-fieldsetPanel-caption", :index => 3).text

Recomendacion

a.div(:class=> "v-label", :index => 38).text


#captura
reco=browser.div(:class=> "v-fieldsetPanel", :index=>3).text
reco=reco.lines.to_a
#hora
rech=reco[0].slice(15..19)

	# 0 - No se han detectado problemas suficientemente graves en la Capa
	if reco.grep(/No se han/).any?
		captura.write ",0 -"+rech
		else
		# 1 - Chequee si hay falta de microfiltro
		if reco.grep(/Chequee si hay falta de microfiltro/).any?
			captura.write ",1 -"+rech
			else
			# 2 - Se recomienda Despacho
			if reco.grep(/Se recomienda Despacho/).any?
				captura.write ",2 -"+rech
				else
				# 3 - Sin recomendacion
				if reco==""
					captura.write ",3 -"+rech
					else
				log=File.new("c:\\atsc\\log.txt","a+")
				log.write reco.to_s
				end
			end
		end
	end




tabla de conexiones:

(a.table(:class =>"v-table-table", :index =>4)).text



(a.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").exists?

filas=(a.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").table(:class =>"v-table-table").rows.length
capt=""
if filas<5
	for i in 0..filas-1
	capt=capt+(a.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").table(:class =>"v-table-table")[i].text.gsub(/\n/,",")+","
	end
else
	for i in 0..4
	capt=capt+(a.div :id => "portlet_ns_Z7_6GNT2MT2I5LHC0IJVKAC7010G4_").table(:class =>"v-table-table")[i].text.gsub(/\n/,",")+","
	end
end

puts capt






browser.div(:class=>"v-fieldsetPanel",:text=> /Sincro/).text