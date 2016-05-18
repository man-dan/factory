require './factory.rb'

test = Factory.new(:name, :address, :zip)
pod_test = test.new("Den","Universal street", 221)
pod_test2 = test.new("Ivan","Karuna street", 263)
pod_test3 = test.new("Den","Universal street", 221)
puts pod_test3==pod_test
puts pod_test3[1]
puts pod_test3[-1]= 100