ROMEO = "romeo-juliet.txt"
HAMLET = "hamlet.txt"

def words(filename)
    begin 
    File.read(filename).downcase.gsub(/[^a-z]/," ").split
rescue
    puts "#{ROMEO} wasn't found mate"
    exit
end
end

wordsArrayRomeo = words(ROMEO)
wordsArrayHamlet = words(HAMLET).uniq
WORDCOUNT = {}

wordsArrayHamlet.each do |word|
    wordsArrayRomeo.delete word
end

wordsArrayRomeo.each do |word|
    WORDCOUNT[word]=0 unless WORDCOUNT[word]
    WORDCOUNT[word]+=1
end

WORDCOUNT.sort_by {|word,count|count}
        .reverse[0...40]
        .each{|word,count| puts "#{word}: #{count}"}