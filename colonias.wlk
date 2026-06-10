class Colonia{
    var zonaHabitada
    const criaturas = []

    method poderOfensivo() = criaturas.sum({c => c.poderOfensivo()})

    method atacarA(unaZona){
        if (self.superaLaDefensaDe(unaZona)){
            zonaHabitada = unaZona
            unaZona.serOcupadaPor(self)
        }
        else
            self.sufrirDerrota()
    }
    method superaLaDefensaDe(unaZona) = self.poderOfensivo() > unaZona.poderDefensivo()
    
    method sufrirDerrota(){
        criaturas.forEach({c => c.perderPoderMagico()})
    }

    method cantDeFormidables() = criaturas.count({c => c.esFormidable()})
}

class Area{
    var habitantes

    method poderDefensivo()
    method serOcupadaPor(unaColonia){
        habitantes = unaColonia
    }
}
class Castillo inherits Area{
    override method poderDefensivo() = 200 * habitantes.cantDeFormidables()
}
class Claros inherits Area{
    override method poderDefensivo() = 100 + habitantes.poderOfensivo()
}