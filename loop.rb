require 'csv'
require_relative './helpers'
def processText()

    f = File.open("ggg.txt")
    a = []
    File.readlines(f).each do |line|
        a.push(line.strip) 

    

    end

    # .str.each_line.chomp do |line|
    
    # a = f.readlines
    # puts a[2]
    # puts a[12]





    # fileName = file.to_s
    # lines = File.open("phone2.txt")
    # s = readlines.each do |line|
        
    
   
    lineCount = a.size
     book = CSV.open("file22.csv", "wb", headers:true)  
   
    # puts lines[0]
        auto = []
        b = []
        average = Array.new
        print_time_spent do



          auto = []

      
         cc = []


        CSV.foreach('ggg.csv', headers:true) do |row|

            auto = row['Phoneday'].gsub(/\D/, '')
            blue = row
        #   auto.push(row['Car make'])
          if a.any? {|word| word == auto}
          
          
          else
          
          cc.push(blue)   
          end 
                    #puts row['Car make']
         

          end 

          puts cc
          end


          #  p auto
        # loop through a 


    
     #p blue

    # if a.any? {|word| word == "FORD"}
    # puts "FOUND match"
    # else
    # puts "did not find match"
     
    # end 

end
processText()

#file = File.open('phone.txt', 'r')
#file.each_line {|line| puts line}
#puts file.count

x = ["100","124","125","126","127"]


# if x.any? {|word| word == "127"}
#     puts "FOUND match"
# else
#     puts "did not find match"

# end 