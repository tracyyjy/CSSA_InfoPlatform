namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_groups
    make_microposts
    make_relationships
  end
end

def make_users

                        
  admin = User.create!( name: "AdminUser",
                        email:"admin@admin.com",
                        password:"adminadmin",
                        password_confirmation:"adminadmin")
  admin.toggle!(:admin)
  default_user = User.create!( name: "jiangyu",
                        email:"jiangyu@umail.ucsb.edu",
                        password:"123456",
                        password_confirmation:"123456")
  
  99.times do |n|
    name="user"
    email="user#{n+1}@user.com"
    password="123456"
    User.create!(name: name,
                        email: email,
                        password: password,
                        password_confirmation: password)
  end

end

def make_groups
  group_annoucement = Group.create!(  group_name: "annoucement",
                                      group_description: "Annoucement Group")
 
  group_carpool = Group.create!(  group_name: "carpool",
                                  group_description: "Carpool Group")          
  
  group_rent_lease = Group.create!( group_name: "rent_lease",
                                    group_description: "Rent or Lease Group")   

  group_sale = Group.create!( group_name: "sale",
                              group_description: "Sell or Buy Group")
end

def make_relationships
  joiner_users=User.all # jiangyu@umail
  groups=Group.all
  joined_groups=groups[0..3] # four default group
  for user in joiner_users
    joined_groups.each{|joined| user.join!(joined)} 
  end
end        

def make_microposts
#   users=User.all(limit: 2)
#   groups=Group.all
#   for i in 0..3
#     users.each {|user| user.microposts.create!(cotent: "Hello World Group"+groups[i].group_name,
#                                             group_name:groups[i].group_name, 
#                                             group_id: groups[i].id)}
#   end
# 
end                  
  