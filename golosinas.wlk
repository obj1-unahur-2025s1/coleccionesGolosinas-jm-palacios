object bombon {
  var peso = 15

  method precio() = 5
  method sabor() = frutilla
  method contieneGluten() = false
  method mordisco() { peso = ((peso*0.8)-1).max(0)}
  method peso() = peso  
} 
object alfajor {
  var peso = 300

  method precio() = 12
  method sabor() = chocolate
  method contieneGluten() =  true
  method mordisco() { peso = (peso*0.8).max(0)}
  method peso() = peso  
}
object caramelo {
  var peso = 5

  method precio() = 1 
  method sabor() = frutilla
  method contieneGluten() = false
  method mordisco() { peso = (peso-1).max(0)}
  method peso() = peso  
}
object chupetin {
  var peso = 7

  method precio() = 2
  method sabor() = naranja
  method contieneGluten() = false
  method mordisco() {
    if (peso > 2){ peso = (peso*0.9).max(2)}    
  }   
  method peso() = peso   
}
object oblea {
  var peso = 250

  method precio() = 5 
  method sabor() = vainilla
  method contieneGluten() = true
  method mordisco() { 
    if (peso > 70){ peso = (peso*0.5)}
    else {peso = (peso*0.75).max(0)}
  }
  method peso() = peso  
}
object chocolatin {
  var pesoInicial = 'desconocido'
  var peso = pesoInicial

  method indicarPesoInicial(unPeso) { 
    pesoInicial = unPeso
    peso = pesoInicial}
  method precio() = pesoInicial * 0.50 
  method sabor() = chocolate
  method contieneGluten() = true
  method mordisco() { peso = (peso-2).max(0)}
  method peso() = peso    
}
object golosinaBaniada {
  var golosinaBase = oblea
  var pesoBaniado = 4

  method precio() = golosinaBase.precio() + 2 
  method sabor() = golosinaBase.sabor()
  method contieneGluten() = golosinaBase.contieneGluten()
  method mordisco() {
    golosinaBase.mordisco()
    pesoBaniado = (pesoBaniado-2).max(0)
  }
  method peso() = golosinaBase.peso() + pesoBaniado 
  method cambioGolosinaBase(unaGolosina) {golosinaBase = unaGolosina}   
}
object pastillaTuttiFrutti {
  var peso = 5
  var gluten = false
  var sabor = frutilla

  method precio() = if(gluten == false) 7 else 10
  method sabor() = sabor
  method contieneGluten() = gluten
  method mordisco() { sabor = sabor.siguiente()}  
  method cambioConGluten() {gluten = true}
  method cambioSingluten() {gluten = false}
  method peso() = peso  
  method peso(unPeso) {peso = unPeso}
}
object frutilla {
  method siguiente() = chocolate 
}
object chocolate {
  method siguiente() = naranja 
}
object naranja {
  method siguiente() = frutilla
}
object vainilla {
  
}
object mariano {
  const bolsa = []   

  method comprar(unaGolosina) {bolsa.add(unaGolosina)}
  method desechar(unaGolosina) {bolsa.remove(unaGolosina)}
  method cantidadDeGolosinas() = bolsa.size()
  method tieneLaGolosina(unaGolosina) = bolsa.contains(unaGolosina)
  method probarGolosinas() { bolsa.forEach({g =>g.mordisco()})}
  method hayGolosinaSinTACC() = bolsa.any({g =>g.contieneGluten() == false})
  method preciosCuidados() = bolsa.all({g =>g.precio() <= 10}) 
  method golosinaDeSabor(unSabor) = bolsa.find({g =>g.sabor(unSabor)})
  method golosinasDeSabor(unSabor) = bolsa.filter({g =>g.sabor(unSabor)})
  method sabores() = bolsa.map({g =>g.sabor()}).asSet()
  method golosinaMasCara() = bolsa.max({g =>g.precio()})
  method pesoGolosinas() = bolsa.sum({g =>g.peso()}) 
  method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.asSet().difference(bolsa.asSet())
  method gustosFaltantes(gustosDeseados) = gustosDeseados.asSet().difference(bolsa.asSet()) 
}