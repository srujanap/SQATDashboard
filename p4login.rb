execute "p4 login" do
  user "tenant10"
  command "p4 login -P #{node[:p4passwd]}"
