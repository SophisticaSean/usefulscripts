def rofl(model_number, frequency = 1)
  #model_number = "06G-P4-4995-KR"
  #model_number = "06G-P4-4998-KR"
  model_number = ARGV[0]
  a = `wget -q http://www.nowinstock.net/computers/videocards/nvidia/gtx980ti/; sed -n '1,10000000000p' index.html > blarp.txt; ag "#{model_number}" blarp.txt; rm blarp.txt; rm index.html`
  blarp = []
  #blarp << a.scan(/Amazon.*/)
  #blarp << a.scan(/Newegg.*/)
  blarp << a.scan(/(Amazon|Newegg|TigerDirect|NCIXUS)(?=\s\<\/a).*stockStatus"\>(.*)(?=\<\/td\>\<td)/).join(" ")
  #blarp.each do |item|
    #puts item
    #temp = ""
    #temp = temp + item.join().scan(/\w*/).join()
    #return temp
  #end
  blarp.each { |test| puts test }
  sleep frequency.to_i
end

while true do
  rofl(ARGV[0], ARGV[1])
end

