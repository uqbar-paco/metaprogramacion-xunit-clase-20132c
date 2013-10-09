class Assert

  def self.assert_true(condition)
     unless condition
       raise AssertException 'Fallo el assert'
     end
  end

  def self.assert_false(condition)
    Assert.assert_true !condition
  end

  def self.assert_equals(obj1, obj2)
     self.assert_true(obj1 == obj2)
  end
end

class AssertException < StandardError
end