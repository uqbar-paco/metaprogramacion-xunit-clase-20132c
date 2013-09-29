require_relative '../xunit/mi_test'
require_relative '../xunit/motor_xunit'
require 'rspec'

describe 'Testeo de motor xunit' do

  it 'ejecutar si todos estan bien' do
    motor= MotorXUnit.new
    expect(motor.correr_todos_los_tests(MiTest)).to eq(true)
  end

  it 'ejecutar no pasa si alguno falla' do
    motor = MotorXUnit.new
    expect(motor.correr_todos_los_tests(OtroTest)).to eq(false)
  end

end