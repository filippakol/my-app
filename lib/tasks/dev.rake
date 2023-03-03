desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  names=[Jason, Filippa, Ayisha, Jared]
  lastnames=[Smith, White, Stan, Zucker]
  4.times do |count|
    user = User.new
    user.first_name = names.at(count)
    user.last_name= lastnames.at(count)
    user.email="email"
    user.password="password"
    user.save
  end
end
