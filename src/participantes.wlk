import conocimientos.*
import cumbre.*
import paisesEmpresasActividades.*


class Participante {
	var property pais
	const conocimientos = #{}
	var commits  
	
	method agregarConocimiento(conocimiento) {conocimientos.add(conocimiento)}
	method esCape()
	
	//alternativa con super
	method puedeEntrar() = conocimientos.contains(programacionBasica)

	method condicionBasica() = conocimientos.contains(programacionBasica)
	method condicionAdicional()
	
	//alternativa sin super
	method puedeEntrar2() = self.condicionBasica() && self.condicionAdicional()
	
	method realizarActividad(actividad) {
		self.agregarConocimiento(actividad.tema())
		commits += actividad.commitsOtorgados()
	}
}

class Programador inherits Participante{
	var property horasCapacitacion = 0
	
	override method esCape() = commits > 500
	override method puedeEntrar() = super() && commits >= cumbre.commitsMinimosProgramador()
	override method condicionAdicional() = commits >= cumbre.commitsMinimosProgramador()
	override method realizarActividad(actividad) {
		super(actividad)
		horasCapacitacion += actividad.horas()
	}
}

class Especialista inherits Participante{
	override method esCape() = conocimientos.size() > 2
	override method puedeEntrar() = super() && commits >= cumbre.commitsMinimosProgramador() - 100 && conocimientos.contains(objetos)
	override method condicionAdicional() = commits >= cumbre.commitsMinimosProgramador() - 100 && conocimientos.contains(objetos)
}

class Gerente inherits Participante {
	const property empresa
	
	override method esCape() = empresa.esMultinacional()
	override method puedeEntrar() = super() and conocimientos.contains(manejoDeGrupos)
	
}

class Empresa {
	var property establecidaEnPaises = #{}
	
	method agregarPais(pais) {
		establecidaEnPaises.add(pais)
	}
	method esMultinacional() = establecidaEnPaises.size() >= 3
	
}