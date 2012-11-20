open("offenseCodes.txt").each do |record|

  flag, code, type, description, ncgeneralstatute, offensestartdate, 
    offenseenddate, clas, classstartdate, classenddate, dwireport, maxdate, 
    typeofletter, english, spanish, updatedatetime, updateuser = record.split("\t")

  exists = "if exists(select * from OffenseCode where Code = '#{code}') begin "
  baseSQL = "update OffenseCode set flag = '#{flag}', [type] = '#{type}', offensedescription = '#{description.gsub(/'/, '''').strip}', ncgeneralstatue = '#{ncgeneralstatute.to_s.strip}', offensestartdate = '#{offensestartdate}', offenseenddate = '#{offenseenddate}', [class] = '#{clas}', classstartdate = '#{classstartdate}', classenddate = '#{classenddate}', dwireport = '#{dwireport}', maxdate = '#{maxdate}', typeofletter = '#{typeofletter}', englishlaymandescription = '#{english.to_s.gsub(/'/, '''')}', spanishlaymandescription = '#{spanish}', updatedatetime = GetDate(), updateuser = 'mjeaton' where code = '#{code}'"
  endsql = " end "

  puts exists + baseSQL + endsql
end
