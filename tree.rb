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
    ls = Dir.entries(".")
    ls.each do |el|
        # Пропускаем текущий и родительский каталоги
        if (el == ".") || (el == "..")
            next
        end
            
        print_element(el, level)
        
        if File.directory? el
            walk(el, level)
        end
    end
  
    Dir.chdir("..")
end

walk(".", 0)