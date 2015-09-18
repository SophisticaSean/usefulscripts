def rofl(model_number, frequency = 1)
  model_number = ARGV[0]
  nowinstock_path = ARGV[1]
  a = `wget -q -O temp.html http://www.nowinstock.net/#{nowinstock_path}; sed -n '1,10000000000p' temp.html > blarp.txt; ag "#{model_number}" blarp.txt; rm blarp.txt`
  blarp = []
  blarp << a.scan(/(Amazon|Newegg|TigerDirect|NCIXUS)(?=\s\<\/a).*stockStatus"\>(.*)(?=\<\/td\>\<td)/) #.join(" ")
  new = []
  if !blarp.first.empty?
    blarp.first.each do |i|
      a = i.join(" ")
      new << a
    end
  end

  new.each do |new_item|
    if new_item.include? "In Stock"
      p new_item
    end
  end

  system('rm temp.html')
  sleep frequency.to_i
end

10.times do
  rofl(ARGV[0], ARGV[1])
end

