class MotorXUnit

  def correr_todos_los_tests(clase)
    clase.instance_methods.
        select { |metodo|
      metodo.to_s.start_with?('test_') }.
        all? { |metodo|
      begin
        clase.new.send metodo
        true
      rescue Exception
        false
      end
    }
  end

end