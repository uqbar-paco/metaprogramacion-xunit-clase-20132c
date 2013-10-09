class MotorXUnit
  attr_accessor :informador

  def initialize(informador)
    @informador=informador
  end

  def correr_todos_los_tests(clase)
    clase.instance_methods.
        select { |metodo|
      metodo.to_s.start_with?('test_') }.
        collect { |metodo|
      begin
        instancia = clase.new
        instancia.setup
        instancia.send metodo
        @informador.informar_ok(clase,metodo)
      rescue AssertException => excepcion
        @informador.informar_falla(clase,metodo,excepcion)
      rescue Exception => excepcion
        @informador.informar_error(clase,metodo,excepcion)
      end
    }
  end

end

class ResultadoBueno
  attr_reader :clase, :metodo

  def initialize(clase, metodo)
    @clase=clase
    @metodo=metodo
  end

  def paso?
    true
  end

  def error?
    false
  end

end


class ResultadoMalo

  attr_reader :clase, :metodo, :excepcion

  def initialize(clase, metodo, excepcion)
    @clase=clase
    @metodo=metodo
    @excepcion=excepcion
  end

  def paso?
    false
  end

end

class ResultadoErroneo < ResultadoMalo

  def error?
    true
  end

end

class ResultadoFalla < ResultadoMalo

  def error?
    false
  end
end

class Resultados
  attr_reader :resultados

  def initialize(resultados=[])
    @resultados = resultados
  end

  def todos_pasaron?
    @resultados.all?{ |resultado| resultado.paso?}
  end

  def todos_error?
    @resultados.all?{|resultado| resultado.error?}
  end

  def informar_ok(clase, metodo)
    @resultados << ResultadoBueno.new(clase, metodo)
  end

  def informar_falla(clase, metodo, excepcion)
    @resultados << ResultadoFalla.new(clase, metodo, excepcion)
  end

  def informar_error(clase, metodo, excepcion)
    @resultados << ResultadoErroneo.new(clase, metodo, excepcion)
  end

end