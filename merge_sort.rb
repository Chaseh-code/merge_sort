def merge(left, right)
    array = []
    l = 0
    r = 0
    (left.length + right.length).times do 
        if l >= left.length
            array << right[r]
            r +=1          
        elsif r >= right.length
            array << left[l]
            l +=1           
        elsif left[l] > right[r]
            array << right[r]
            r +=1            
        else
            array << left[l]
            l +=1
        end
    end
    array
end

def merge_sort(array)
    if array.length<=1
        array
    else
        left = merge_sort(array[0..(array.length/2).floor-1]) #left half
        right = merge_sort(array[array.length/2..array.length-1]) #right half
        merge(left, right)
    end
end

def testing(n)
    tests = []
    array = []
    n.times do 
        array = []
        (2+rand(10)).times do |i|
            array << (1+rand(800))
        end
        tests << array
    end

    n.times do |num|
        puts "\nOriginal Array: #{tests[num]}"
        puts "Sorted Array: #{merge_sort(tests[num])}\n"
    end
    
end

testing(10)