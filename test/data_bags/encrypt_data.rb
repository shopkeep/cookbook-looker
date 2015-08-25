#!/usr/bin/env ruby

require 'chef/encrypted_data_bag_item'

secret = Chef::EncryptedDataBagItem.load_secret('../encrypted_data_bag_secret')

unencrypted_data_bag = ARGV[0]
target = ARGV[1]

data = JSON.parse(File.read("./#{unencrypted_data_bag}"))

encrypted_data = Chef::EncryptedDataBagItem.encrypt_data_bag_item(data, secret)

File.open(target, 'w') do |f|
  f.print JSON.pretty_generate(encrypted_data) + "\n"
end