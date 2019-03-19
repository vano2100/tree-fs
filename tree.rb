#!ruby

def prefix(char, level)
    char * level
end
  
def print_element(element, level)
    print prefix(" ", level), element, "\n"
end
  
def walk(dir, level)
    Dir.chdir(dir)
    level = level + 1
    Dir.foreach(".") do |item|
        # Пропускаем текущий и родительский каталоги
        if (item == ".") || (item == "..")
            next
        end
            
        print_element(item, level)
        
        if File.directory? item
            walk(item, level)
        end
    end
  
    Dir.chdir("..")
end

walk(".", 0)