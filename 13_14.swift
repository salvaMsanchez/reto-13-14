import Foundation

// Clase contenedora de todos los métodos necesarios para la ejecución del reto
class GestionReto {
	
	// Método público que lanza el programa en su totalidad
	func caso() {

		casosDescritos(lecturaCasos())

	}

	// Método que devuelve el número de casos a analizar a lo largo del programa
	private func lecturaCasos() -> Int {
		var entradaCorrecta: Bool = false
		while(!entradaCorrecta) {
			if  let entradaCasos = readLine(), 
				let numCasos = Int(entradaCasos) {
					if numCasos > 0 && numCasos < 1_000_000 {
						entradaCorrecta = true
						return numCasos
					} else {
						print("Error: Has introducido un número de casos no permitido. Por favor, introduce un número mayor que 0 y menor a 1000000.")
					}
				} else {
					print("Error: Has introducido texto. Por favor, introduce un número positivo.")
				}
		}
	}

	// Método que devuelve los números que contiene el formato llave de forma separada en un Array de String. Ej: ["13", "14"]
	private func lecturaLlaveTaller() -> [String] {

		var entradaCorrectaLlave: Bool = false
		while (!entradaCorrectaLlave) {
			if let entradaLlave = readLine() {
				if (entradaLlave.contains("-")) {
					let entradaDividida: [String] = entradaLlave.components(separatedBy: "-")
					entradaCorrectaLlave = true
					return entradaDividida
				} else {
					print("Error. No has introducido un formato correcto de llave. Ejemplo: 13-14.")
				}
			}
		}
	}

	// Método que analiza la validez de los números de la llave según los condicionantes: "las llaves que existen tienen en cada extremo calibres consecutivos, siendo el menor de ellos par"
	private func analizarValidezLlave(_ numerosLlave: [String]) -> Bool {

		if (numerosLlave[0] < numerosLlave[1]) {
			guard let numMenor: Int = Int(numerosLlave[0]),
				  let numMayor: Int = Int(numerosLlave[1]) else {
				  	print("Formato erróneo de las llaves. No son números")
				  	return false
				  }

			guard (numMenor == numMayor - 1),
			      (numMenor % 2 == 0) else {
				return false
			}

			return true

		} else if (numerosLlave[0] == numerosLlave[1]) {
			return false
		} else {
			guard let numMenor: Int = Int(numerosLlave[1]), 
				  let numMayor: Int = Int(numerosLlave[0]) else {
				  	print("Formato erróneo de las llaves. No son números")
				  	return false
				  }

			guard numMenor == numMayor - 1,
			      numMenor % 2 == 0 else {
				return false
			}

			return true

		}
		
	}

	// Método que recibe el número de casos a anlizar como parámetro y que, tras la lectura de llaves y el análisis de las mismas, imprime la salida
	private func casosDescritos(_ numCasos: Int) {
		for _ in 1...numCasos {
			let numerosLlave: [String] = lecturaLlaveTaller()
			let salida: Bool = analizarValidezLlave(numerosLlave)

			if salida {
				print("SI")
			} else {
				print("NO")
			}
		}
	}

}

// Main
let gestionReto: GestionReto = GestionReto()
gestionReto.caso()
