class Persona{
	const emociones = []
	var eventos = []
	var property nivelIntensidad = 200
	var edad
	
	method esAdolescente() = edad.between(12,19)
	
	method sufriImpacto(emocion) = emocion.liberar(emocion)
	
	method estaPorExplotar() = self.estaEn(self) and self.todasPuedenLiberarse(self)
	
	method todasPuedenLiberarse(emocion) = emociones.all(emocion.puedeLiberarse()) 
	
	method estaEn(emocion) = emociones.contains({emoc => emoc.estaEn(emocion)})
	
	// si la intensidad de la emocion es menor a 100 cambio el nivel de intesidad por el que posee la persona + 10
	method cambiarNivelIntesidad(emocion){
		const intensidadEmocion = emocion.intensidad()
		if(not self.esElevadaIntensidad(emocion)){
			intensidadEmocion == self.nivelIntensidad() + 10
		}
		return intensidadEmocion	
		}
	
	method esElevadaIntensidad(emocion) = emocion.intensidad() > 100
	
	method generarEvento(evento){
		var event = new Evento(
			descripcion = "",
			impacto = impacto,
			emocionLiberada = emocionLiberada
		)
	}
	
}

class Evento{
	var property descripcion
	var property impacto 
	var property emocionLiberada
	
	method liberar(emocion) = emocion.puedeSerLiberada() or emocion.noPuedeLiberarse(emocion)
	
	method cantidadEventos(emocion) = emocion.cantidadEventos()
	
	method fueLiberada(emocion) = self.liberar(emocion)
	
	method noPuedeLiberarse(emocion) = emocion.estaAlterada()
	
	method estaAlterada(emocion) = emocion.disminuirIntensidadsegun()
	
	method impacto()
	
}	

object furia{
	var property intensidad = 100
	var cantidadEventos
	var palabrotas = []
	
	method cantidadEventos() = self.generarEvento()
	
	method generarEvento() = cantidadEventos == cantidadEventos + 1
	
	method olvidarPalabra() = palabrotas.contains({palabra => palabra.remove()})
	
	method puedeSerLiberada() = self.intensidadElevada(self) and self.palabraConmasdesieteLetras()
	
	method intensidadElevada(persona) = self.intensidad() > persona.nivelIntensidad()  
	
	method disminuirIntensidadsegun(impacto) = self.intensidad() == self.intensidad() - impacto.impacto()
	
	method palabraConmasdesieteLetras() = palabrotas.contains({palabra => palabra.cantLetras(palabra) > 7})
	
	method cantLetras(palabrota) = palabrota.length()
	
}

object alegria{
	var property intensidad
	var cantidadEventos
	
	method puedeSerLiberada() = self.intensidadElevada(self) and self.cantidadEventosPar()
	
	method cantidadEventosPar() = self.generarEvento() % 2 == 0
	
	method generarEvento() = cantidadEventos == cantidadEventos + 1
	
	method intensidadElevada(persona) = self.intensidad() > persona.nivelIntensidad()  
	
	method intensidadPos() = intensidad.abs()
	
	method disminuirIntensidadsegun(impacto) = self.intensidadPos() == self.intensidadPos() - impacto.impacto()
}

object tristeza{
	var property intensidad
	const property causa = melancolia
		var cantidadEventos 
	
	method cantidadEventos() = self.generarEvento()
	
	method generarEvento() = cantidadEventos == cantidadEventos + 1
	
	method intensidadElevada(persona) = self.intensidad() > persona.nivelIntensidad()  
	
	method puedeSerLiberada() = not self.esMelancolia() and self.intensidadElevada(self)
	
	method esMelancolia() = self.causa()
	
	method disminuirIntensidadsegun(impacto) = self.intensidad() == self.intensidad() - impacto.impacto()
	
}

object melancolia{
	
}


object desagrado{
	var property intensidad
		var cantidadEventos 
	
	method cantidadEventos() = self.generarEvento()
	
	method generarEvento() = cantidadEventos == cantidadEventos + 1
	method intensidadElevada(persona) = self.intensidad() > persona.nivelIntensidad()  
	method disminuirIntensidadsegun(impacto) = self.intensidad() == self.intensidad() - impacto.impacto()
}

object temor{
	var property intensidad
		var cantidadEventos 
	
	method cantidadEventos() = self.generarEvento()
	
	method generarEvento() = cantidadEventos == cantidadEventos + 1
	method intensidadElevada(persona) = self.intensidad() > persona.nivelIntensidad()  
	method disminuirIntensidadsegun(impacto) = self.intensidad() == self.intensidad() - impacto.impacto()
}

// la ansiedad genera un nivel de intesidad de mas de 1000 en la persona y crea 3 eventos distintos , como si la persona estuviera sobrepensando

//utilizando composicion puedo crear distintos objetos de emociones, ya que cada emocion es unica, pero afecta de disintas maneras a cada persona,
// para asi poder representarlas de manera eficiente y hacer los cambios futuros que cada una necesite.
// mediante el polimorfismo puedo hacer que cada evento reconozca cuando liberar una emocion y que la persona sea quien recibe ese evento, provocando una sucesion de hechos
// y cambios de humor, etc

object intesidad{
	var property intensidad = 1000
	var cantidadEventos 
	
	method cantidadEventos() = self.generarEvento()
	
	method generarEvento() = cantidadEventos == cantidadEventos + 3
	
	method puedeSerLiberada() = self.intensidadElevada()
	
	method intensidadElevada() = self.intensidad()  
	
	method disminuirIntensidadsegun(impacto) = self.intensidad() == self.intensidad() - impacto.impacto()
	
}
