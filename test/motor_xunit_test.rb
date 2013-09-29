require 'test/unit'
require_relative '../xunit/mi_test'
require_relative '../xunit/motor_xunit'

class MotorXUnitTest < Test::Unit::TestCase

  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_ejecutar_pasa_si_todos_estan_bien
    motor= MotorXUnit.new
    self.assert_equal(true,
                      motor.correr_todos_los_tests(MiTest))
  end


  def test_ejecutar_no_pasa_si_alguno_falla
    motor= MotorXUnit.new
    self.assert_equal(true,
                      motor.correr_todos_los_tests(OtroTest))
  end
end