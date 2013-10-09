require_relative '../xunit/motor_xunit'
require_relative '../test/mi_test'
require_relative '../xunit/informador_consola'
require_relative '../test/motor_xunit_test'

motor = MotorXUnit.new(InformadorConsola.new)
motor.correr_todos_los_tests(MotorXUnitTest)
puts 'Fin'