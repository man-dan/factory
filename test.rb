require './factory.rb'

test = Factory.new(:name, :address, :zip)
pod_test = test.new("Den","Universal street", 221)
pod_test2 = test.new("Ivan","Karuna street", 263)
puts pod_test2.address