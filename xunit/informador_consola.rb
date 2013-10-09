class InformadorConsola

  def informar_ok(clase, metodo)
    puts 'Ok: ',clase,metodo
  end

  def informar_falla(clase, metodo, excepcion)
    puts 'Falla: ',clase,metodo,excepcion.backtrace
  end

  def informar_error(clase, metodo, excepcion)
    puts 'Error: ',clase,metodo,excepcion.backtrace
  end

end