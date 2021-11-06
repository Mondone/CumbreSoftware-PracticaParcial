import cumbre.*
import conocimientos.*

class Pais {
	const conflictivos = []
	
	method tieneConflictoCon(pais) = conflictivos.contains(pais)
	
	method registrarConflicto(pais) {
		conflictivos.add(pais)
	}
//	method esConflictivo() = cumbre.esConflictivo(self)
	
}


class Actividad {
	var property tema = programacionBasica
	var property horas = 0
	
	method commitsOtorgados() =  horas * tema.commitsPorHora()
	
}