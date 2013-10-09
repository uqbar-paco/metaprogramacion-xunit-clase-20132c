require_relative '../test/mi_test'
require_relative '../xunit/assert'
require_relative '../xunit/motor_xunit'

class MotorXUnitTest

  def setup
    @motor= MotorXUnit.new Resultados.new
  end

  def test_ejecutar_pasa_si_todos_estan_bien
    @motor.correr_todos_los_tests(MiTest)
    Assert.assert_true @motor.informador.todos_pasaron?
  end


  def test_ejecutar_no_pasa_si_alguno_falla
    @motor.correr_todos_los_tests(OtroTest)
    Assert.assert_equals @motor.informador.todos_pasaron?, false
  end

  def test_falla_test_lanza_excepcion
    @motor.correr_todos_los_tests(TestQueTiraError)
    Assert.assert_true @motor.informador.todos_error?
  end

  def test_no_hay_errores_si_se_lanzaron_excepciones_inesperadas
    @motor.correr_todos_los_tests(MiTest)
    Assert.assert_false @motor.informador.todos_error?
  end
end