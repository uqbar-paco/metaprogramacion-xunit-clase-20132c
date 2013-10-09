require_relative '../xunit/mi_test'
require_relative '../xunit/motor_xunit'
require 'rspec'

describe 'Testeo de motor xunit' do

  it 'ejecutar si todos estan bien' do
    motor= MotorXUnit.new
    resultados = motor.correr_todos_los_tests(MiTest)
    expect(resultados.all? {
        |resultado| resultado.paso?
    }).to eq(true)
  end

  it 'ejecutar no pasa si algun test falla' do
    motor = MotorXUnit.new
    resultados = motor.correr_todos_los_tests(OtroTest)
    expect(resultados.all? { |resultado|
      resultado.paso? }).to eq(false)
  end

  it 'Falla un test que lanza una excepcion' do
    motor = MotorXUnit.new
    resultados = motor.correr_todos_los_tests(TestQueTiraError)
    expect(resultados.all? { |resultado|
      resultado.error? }).to eq(true)
  end

  it 'No hay errores si no se lanzaron excepciones inesperadas' do
    motor = MotorXUnit.new
    resultados = motor.correr_todos_los_tests(MiTest)
    expect(resultados.all? { |resultado|
      resultado.error? }).to eq(false)
  end

end