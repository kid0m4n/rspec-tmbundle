context "Running specs with --diff" do
  specify "should printed diff of different strings" do
    uk = <<-EOF
Rspec is a
behaviour driven development
framework for Ruby
EOF
    usa = <<-EOF
Rspec is a
behavior driven development
framework for Ruby
EOF
    usa.should == uk
  end

  class Animal
    def initialize(name,species)
      @name,@species = name,species
    end

    def inspect
      <<-EOA
<Animal
name=#{@name},
species=#{@species}
>
      EOA
    end
  end

  specify "should print diff of different objects' pretty representation" do
    expected = Animal.new "bob", "giraffe"
    actual   = Animal.new "bob", "tortoise"
    expected.should_eql actual
  end
end