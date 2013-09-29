class Assert

  def self.assert_true(condition)
     unless condition
       raise 'Fallo el assert'
     end
  end

end