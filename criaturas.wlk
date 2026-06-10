class Criatura{
    var poderMagico
    const astucia
    var rol
    
    method rol() = rol
    method poderMagico() = poderMagico
    method poderOfensivo() = (10*poderMagico) + rol.poderExtra(self)
    method esFormidable() = self.esAstuta() || self.esExtraordinaria()
    method esExtraordinaria() = rol.esExtraordinario(self)
    method esAstuta()

    method cambiarRol(){ // muy estructurado?
        if (rol.className() == "Criaturas.Guardian")
            rol = new Domador(mascotas=[new MascotaMitologica(edad=1,tieneCuernos=false)])
        else if (rol.className() == "Criaturas.Domador" && rol.mascotas().any({m => m.tieneCuernos()}))
            rol = new Hechicero() // y error?
        else
            rol = new Guardian()        
    }

    method perderPoderMagico(){
        poderMagico -= poderMagico*0.15
    }
}


class Duende inherits Criatura{
    override method poderOfensivo() =  super() * 1.1
    override method esAstuta() = false
}

class Hada inherits Criatura{
    var kilometrosQueVuela = 2

    override method esFormidable() = super() && kilometrosQueVuela>10
    override method esAstuta() = poderMagico > 50

    method aumentarKm(){
        kilometrosQueVuela = 25.min(kilometrosQueVuela + 1)
    }
}

//Quizás solo Domador sea una Class. Es el único con atributos que cambian (las mascotas entrenadas)?
class Guardian{
    method poderExtra(unaCriatura) = 100
    method esExtraordinario(unaCriatura) = unaCriatura.poderMagico() > 50
}
class Hechicero{
    method poderExtra(unaCriatura) = 0
    method esExtraordinario(unaCriatura) = true
}
class Domador{
    const property mascotas = []
    method poderExtra(unaCriatura) = 150 * unaCriatura.mascotas().count({m => m.tieneCuenos()})
    method esExtraordinario(unaCriatura) = (unaCriatura.poderMagico() >= 15) && unaCriatura.mascotas().forEach({m => m.esVeterana()})
}


class MascotaMitologica{
    const property edad
    const property tieneCuernos

    method esVeterana() = edad >= 10
}
