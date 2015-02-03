
require "watir-webdriver"
require "C:\\Ruby193\\gpym.rb"
require "c:\\Ruby193\\set.rb"

begin
@client = Selenium::WebDriver::Remote::Http::Default.new
# Timeout navegador
@client.timeout = 15 # seconds – default is 60

a=Watir::Browser.new :chrome :http_client => @client ,:switches => ['--ignore-certificate-errors']
# Tamaño y posicion del navegador
#a.window.resize_to(@width, @height)
#a.window.move_to(@xpos, @ypos)

# Timeouts de objetos
a.driver.manage.timeouts.implicit_wait = 14

ingreso=ingresogypm(a,@user,@pass)


a.text_field(:name, "idCriterio").set "idact"

a.element(:title, "Buscar").click


if not a.element(:class=>"titleError").exists?
	if a.table(:class=>"fila-tabla-par", :index=>1)[3][3].text=="CUMPLIMENTABLE"
		cumplir a

		a.text_field(:name, "textObservacion").set "bo_obs"
		rescue
			retry
		end

		begin
		a.button(:src, "/gpm/images/lupa.gif").click

		rescue Timeout::Error
		end


		a.windows.last.use
		falta="FALTA EN CENTRAL"
		seleccion a,falta

		a.windows.first.use

		#Seleccionar motivo|
		a.element(:title, "Confirmar").click

		a.element(:id, "trdescripcionMotivo11").click

		a.execute_script "validateData()"

		if a.text_field(:name, "idCriterio").exists?
			a.text_field(:name, "idCriterio").set==""
			#Clasificado OK
		else
			#Error en la clasificacion
		end
	else
		#Stand by
	end
else
#Estado no operable
end








