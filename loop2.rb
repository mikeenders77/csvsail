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
       
   
    # puts lines[0]
        auto = []
        b = []
        average = Array.new
        print_time_spent do



          auto = []

      
         #cc = CSV.table('ggg.csv', headers:true)


        # x.delete_if { |row| y_rows.include?(row) }

        note = []
        csv = []
        counter = 0
        #csv = CSV.foreach('ggg.csv', headers:true) do |row|

           # counter += 1
           # auto = row['Phoneday'].gsub(/\D/, '')
           # puts counter
            col_data = []
            match = []
        csv = CSV.foreach('ggg.csv', headers:true) {|row| col_data << row[18].gsub(/\D/, '')}    

        #   auto.push(row['Car make'])
         # if a.any? {|word| word == auto}
         
           # cc.delete(counter)
         
         
         puts counter
         puts col_data.size
              
          col_data.each do |line|          
          counter += 1
          if a.any? {|word| word == line}
         # else
          match.push(line)

          puts counter

          else
            
         
                    #puts row['Car make']
         end

          end 

          
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