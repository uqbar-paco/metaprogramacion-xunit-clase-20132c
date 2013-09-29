require_relative '../xunit/assert'

class MiTest

  def test_es_verdadero
    Assert.assert_true true
  end

end

class OtroTest
  def test_es_vedadero?
    Assert.assert_true false
  end
end